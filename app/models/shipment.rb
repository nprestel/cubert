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
  belongs_to :equipment
  
  accepts_nested_attributes_for :pieces, :allow_destroy => true
  include ActionView::Helpers::NumberHelper
  
    
  def gross_weight_lbs
      self.pieces.sum(:gross_weight_lbs)
  end
  
  def gross_volume_cuft
      self.pieces.sum(:gross_volume_cuft)
  end

end
