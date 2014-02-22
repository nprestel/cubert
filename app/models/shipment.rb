# == Schema Information
#
# Table name: shipments
#
#  id                :integer          not null, primary key
#  pieces_count      :integer
#  gross_weight_lbs  :float
#  gross_volume_cuft :float
#  equiptype         :string(255)
#  wt_util           :float
#  cb_util           :float
#  created_at        :datetime
#  updated_at        :datetime
#

class Shipment < ActiveRecord::Base
  has_many :pieces, :dependent => :destroy
  has_one :equipment
  belongs_to :user
  
  after_update :update_shipment_weight_util
    
  accepts_nested_attributes_for :pieces, :allow_destroy => true
  include ActionView::Helpers::NumberHelper
  
  
  def update_shipment_weight_util
    @shipment_weight_util = weight_utilization(self.gross_weight_lbs, self.equiptype)
    self.update_column(:wt_util, @shipment_weight_util)
  end
  
  
  
  
  def weight_utilization(shipweight, equiptype)
      number_to_percentage(5000 / Equipment.where(:equip_name => equiptype).pluck(:wt_limit_lbs).first * 100, :precision => 2)
  end

    # Finds wt_limit_lbs field from Equipment db where code equals the passed param
    # divides the shipweight variable by the Equipment wt_limit_lbs
    # then uses number_to_percentage to convert to % output format and multiplies by 100 for readability

end
