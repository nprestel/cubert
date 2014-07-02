# == Schema Information
#
# Table name: shipments
#
#  id                :integer          not null, primary key
#  pieces_count      :integer
#  gross_weight_lbs  :float
#  gross_volume_cuft :float
#  wt_util           :float
#  cb_util           :float
#  created_at        :datetime
#  updated_at        :datetime
#  name              :string(255)
#  user_id           :integer
#  lqcb_util         :float
#  equipment_id      :integer
#

class Shipment < ActiveRecord::Base
  has_many :pieces, :dependent => :destroy
  belongs_to :equipment, inverse_of: :shipment
  belongs_to :user, :counter_cache => true
  validate :shipment_quota, :on => :create
  after_save :update_pieces

  accepts_nested_attributes_for :pieces, :allow_destroy => true
  include ActionView::Helpers::NumberHelper

  def update_pieces
    self.pieces.each do |f|
      f.update_attribute(:piece_max_su, f.set_max_su)
      f.update_attribute(:piece_cb_util, f.cube_utilization(f.count, f.piece_max_su))
      f.update_attribute(:piece_lqcb_util, f.liquid_cube(f.gross_volume_cuft, Equipment.find_by_id(f.shipment.equipment_id).equip_name))
    end
  end

  def shipment_quota
    if self.user.shipments.count >= 1
      self.errors.add(:base, "Only one Shipment per User")
      return false
    end
  end

end
