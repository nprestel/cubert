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
#  user_id           :integer
#

class Shipment < ActiveRecord::Base
  has_many :pieces, :dependent => :destroy, autosave: true
  has_one :equipment
  belongs_to :user
  after_save :update_pieces
    
  accepts_nested_attributes_for :pieces, :allow_destroy => true
  include ActionView::Helpers::NumberHelper

  def update_pieces
    self.pieces.each do |f|
      f.update_attribute(:piece_max_su, f.set_max_su)
    end
  end

end
