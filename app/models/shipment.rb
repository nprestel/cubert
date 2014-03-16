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
#  lqcb_util         :float
#

class Shipment < ActiveRecord::Base
  has_many :pieces, :dependent => :destroy, autosave: true
  has_one :equipment
  belongs_to :user, :counter_cache => true
  validate :shipment_quota, :on => :create
  after_save :update_pieces

  accepts_nested_attributes_for :pieces, :allow_destroy => true
  include ActionView::Helpers::NumberHelper

  def update_pieces
    self.pieces.each do |f|
      f.update_attribute(:piece_max_su, f.set_max_su)
      f.update_attribute(:piece_cb_util, f.cube_utilization(f.count, f.piece_max_su))
      f.update_attribute(:piece_lqcb_util, f.liquid_cube(f.gross_volume_cuft, f.shipment.equiptype))
    end
  end

  def shipment_quota
   if user.shipments_count > 0
     errors.add(:base, "Only one Shipment per User")
   end
  end

end
