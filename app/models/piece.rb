# == Schema Information
#
# Table name: pieces
#
#  id                :integer          not null, primary key
#  count             :integer
#  length_ins        :float
#  width_ins         :float
#  height_ins        :float
#  stackability      :integer
#  weight_lbs        :float
#  volume_cuft       :float
#  shipment_id       :integer
#  created_at        :datetime
#  updated_at        :datetime
#  piece_name        :string(255)
#  gross_volume_cuft :float
#  gross_weight_lbs  :float
#  piece_cb_util     :float
#  piece_wt_util     :float
#  piece_max_su      :integer
#  piece_lqcb_util   :float
#

class Piece < ActiveRecord::Base

  belongs_to :shipment, inverse_of: :pieces, :counter_cache => true

  validates :length_ins, :width_ins, :height_ins, :count, :weight_lbs, :stackability, presence: true

  before_save :set_volume_cuft, :set_gross_volume_cuft, :set_gross_weight_lbs, :set_piece_wt_util
  after_save :update_shipment_gross_weight_lbs, :update_shipment_gross_volume_cuft, :update_shipment_wt_util, :update_shipment_cb_util, :update_shipment_lqcb_util
  after_destroy :update_shipment_gross_weight_lbs, :update_shipment_gross_volume_cuft, :update_shipment_wt_util, :update_shipment_cb_util, :update_shipment_lqcb_util

   include ActionView::Helpers::NumberHelper
    # validates_presence_of :count, :entry_length, :entry_width, :entry_height, :dims_uofm, :stackability, :entry_weight, :wt_uofm

  def set_volume_cuft
    self.volume_cuft = (self.length_ins/12) * (self.width_ins/12) * (self.height_ins/12)
  end

  def set_gross_volume_cuft
    self.gross_volume_cuft = self.volume_cuft * self.count
  end

  def set_gross_weight_lbs
    self.gross_weight_lbs = self.weight_lbs * self.count
  end

  def set_max_su
    self.piece_max_su = max_shipping_units(self.length_ins, self.width_ins, self.height_ins, self.stackability, self.shipment.equiptype)
  end

  def weight_utilization(shipweight, equiptype)
    temp_equip = (Equipment.where(:equip_name => equiptype).pluck(:wt_limit_lbs).first)
    return number_to_percentage(shipweight / temp_equip * 100, precision: 2)
  end

  def set_piece_wt_util
    self.piece_wt_util = weight_utilization(self.gross_weight_lbs, self.shipment.equiptype)
  end

  def set_piece_cb_util
    self.piece_cb_util = cube_utilization(self.count, self.piece_max_su)
  end

  def set_piece_lqcb_util
    self.piece_lqcb_util = liquid_cube(self.gross_volume_cuft, self.shipment.equiptype)
  end

  def update_shipment_gross_weight_lbs
    shipment.update_column(:gross_weight_lbs, self.shipment.pieces.sum(:gross_weight_lbs))
  end

  def update_shipment_gross_volume_cuft
    shipment.update_column(:gross_volume_cuft, self.shipment.pieces.sum(:gross_volume_cuft))
  end

  def update_shipment_wt_util
    shipment.update_column(:wt_util, self.shipment.pieces.sum(:piece_wt_util))
  end

  def update_shipment_cb_util
    shipment.update_column(:cb_util, self.shipment.pieces.sum(:piece_cb_util))
  end

  def update_shipment_lqcb_util
    shipment.update_column(:lqcb_util, self.shipment.pieces.sum(:piece_lqcb_util))
  end

# Finds wt_limit_lbs field from Equipment db where code equals the passed param divides the shipweight variable by the Equipment wt_limit_lbs then uses number_to_percentage to convert to % output format and multiplies by 100 for readability


    def max_shipping_units(length, width, height, stack, equiptype)

      if ((Equipment.where(:equip_name => equiptype).pluck(:height1_ins).first) / height).to_i > stack
        @cube1_1 = ((Equipment.where(:equip_name => equiptype).pluck(:length1_ins).first) / length).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width1_ins).first) / width).to_i * stack
        @cube1_2 = ((Equipment.where(:equip_name => equiptype).pluck(:length1_ins).first) / width).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width1_ins).first) / length).to_i * stack
      section1 = [@cube1_1, @cube1_2].max

      else
      @cube1_1 = ((Equipment.where(:equip_name => equiptype).pluck(:length1_ins).first) / length).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width1_ins).first) / width).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:height1_ins).first) / height).to_i
      @cube1_2 = ((Equipment.where(:equip_name => equiptype).pluck(:length1_ins).first) / width).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width1_ins).first) / length).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:height1_ins).first) / height).to_i
      section1 = [@cube1_1, @cube1_2].max
      end
      
      if ((Equipment.where(:equip_name => equiptype).pluck(:height2_ins).first) / height).to_i > stack
        @cube2_1 = ((Equipment.where(:equip_name => equiptype).pluck(:length2_ins).first) / length).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width2_ins).first) / width).to_i * stack
        @cube2_2 = ((Equipment.where(:equip_name => equiptype).pluck(:length2_ins).first) / width).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width2_ins).first) / length).to_i * stack
      section2 = [@cube2_1, @cube2_2].max

      else
      @cube2_1 = ((Equipment.where(:equip_name => equiptype).pluck(:length2_ins).first) / length).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width2_ins).first) / width).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:height2_ins).first) / height).to_i
      @cube2_2 = ((Equipment.where(:equip_name => equiptype).pluck(:length2_ins).first) / width).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width2_ins).first) / length).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:height2_ins).first) / height).to_i
      section2 = [@cube2_1, @cube2_2].max
      end
      
      if ((Equipment.where(:equip_name => equiptype).pluck(:height3_ins).first) / height).to_i > stack
        @cube3_1 = ((Equipment.where(:equip_name => equiptype).pluck(:length3_ins).first) / length).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width3_ins).first) / width).to_i * stack
        @cube3_2 = ((Equipment.where(:equip_name => equiptype).pluck(:length3_ins).first) / width).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width3_ins).first) / length).to_i * stack
      section3 = [@cube3_1, @cube3_2].max

      else
      @cube3_1 = ((Equipment.where(:equip_name => equiptype).pluck(:length3_ins).first) / length).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width3_ins).first) / width).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:height3_ins).first) / height).to_i
      @cube3_2 = ((Equipment.where(:equip_name => equiptype).pluck(:length3_ins).first) / width).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:width3_ins).first) / length).to_i * ((Equipment.where(:equip_name => equiptype).pluck(:height3_ins).first) / height).to_i
      section3 = [@cube3_1, @cube3_2].max
      end
      
      return section1 + section2 + section3
    end

    # determine if the unit stackability allowable by the equipment type is greater than the stack param passed
    # if the allowable equipment type stackability is greater than the stack param, use the stack param for height. Otherwise use the allowable stackability
    # calculate the max cube units allowed by equipment type 2 different ways -> 1) length, width divided by one another, then 2) pin-wheeling the unit. Return max of these 2 numbers.

    def cube_utilization(count, max_shipping_units)
      if(max_shipping_units > 0)
        @temp = (count.to_f / max_shipping_units.to_f)
      else
        @temp = 0
      end
      return number_to_percentage(@temp * 100, precision: 2)
    end

    # first validates the maximum allowable shipping units is positive number. If so, divides number of units (as float) by the maximum allowable amount (as float). If not, returns 0.
    # formats result as percent with precision = 2

    def liquid_cube(volume_cuft, equiptype)
      return number_to_percentage(volume_cuft.to_f / Equipment.where(:equip_name => equiptype).first.cb_limit_cuft * 100, precision: 2)
    end

    # params pass ship volume in cuft and equip type. Using equip type, finds the max volume for specific equipment.
    # Divides ship volume by equip volume and returns liquid cube in % format

end
