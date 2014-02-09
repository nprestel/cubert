# == Schema Information
#
# Table name: pieces
#
#  id           :integer          not null, primary key
#  count        :integer
#  length_ins   :float
#  width_ins    :float
#  height_ins   :float
#  stackability :integer
#  weight_lbs   :float
#  volume_cuft  :float
#  shipment_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Piece < ActiveRecord::Base

  belongs_to :shipment, :counter_cache => true
   include ActionView::Helpers::NumberHelper
    # validates_presence_of :count, :entry_length, :entry_width, :entry_height, :dims_uofm, :stackability, :entry_weight, :wt_uofm
      
  def volume_cuft
    self.length_ins * self.width_ins * self.height_ins
  end
  
    def weight_utilization(shipweight, equiptype)
      puts number_to_percentage(shipweight / Equipment.find(:first, :conditions => {:code => equiptype}).wt_limit_lbs * 100, :precision => 2)
    end

    # Finds wt_limit_lbs field from Equipment db where code equals the passed param
    # divides the shipweight variable by the Equipment wt_limit_lbs
    # then uses number_to_percentage to convert to % output format and multiplies by 100 for readability

    def max_shipping_units(length, width, height, stack, equiptype)

      if (Equipment.find(:first, :conditions => {:code => equiptype}).height_ins / height).to_i > stack
        @cube1 = (Equipment.find(:first, :conditions => {:code => equiptype}).length_ins / length).to_i * (Equipment.find(:first, :conditions => {:code => equiptype}).width_ins / width).to_i * stack
        @cube2 = (Equipment.find(:first, :conditions => {:code => equiptype}).length_ins / width).to_i * (Equipment.find(:first, :conditions => {:code => equiptype}).width_ins / length).to_i * stack
      puts [@cube1, @cube2].max

    else
      @cube1 = (Equipment.find(:first, :conditions => {:code => equiptype}).length_ins / length).to_i * (Equipment.find(:first, :conditions => {:code => equiptype}).width_ins / width).to_i * (Equipment.find(:first, :conditions => {:code => equiptype}).height_ins / height).to_i
      @cube2 = (Equipment.find(:first, :conditions => {:code => equiptype}).length_ins / width).to_i * (Equipment.find(:first, :conditions => {:code => equiptype}).width_ins / length).to_i * (Equipment.find(:first, :conditions => {:code => equiptype}).height_ins / height).to_i
    puts [@cube1, @cube2].max
      end
    end

    # determine if the unit stackability allowable by the equipment type is greater than the stack param passed
    # if the allowable equipment type stackability is greater than the stack param, use the stack param for height. Otherwise use the allowable stackability
    # calculate the max cube units allowed by equipment type 2 different ways -> 1) length, width divided by one another, then 2) pin-wheeling the unit. Return max of these 2 numbers.

    def cube(count, max_shipping_units)
      if(max_shipping_units > 0)
        @temp = (count.to_f / max_shipping_units.to_f)
      else
        @temp = 0
      end
    puts number_to_percentage(@temp * 100, :precision => 2)
    end

    # first validates the maximum allowable shipping units is positive number. If so, divides number of units (as float) by the maximum allowable amount (as float). If not, returns 0.
    # formats result as percent with precision = 2

    def liquid_cube(volume_cuft, equiptype)
      puts number_to_percentage(volume_cuft.to_f / Equipment.find(:first, :conditions => {:code => equiptype}).cb_limit_cuft * 100, :precision => 2) 
    end

    # params pass ship volume in cuft and equip type. Using equip type, finds the max volume for specific equipment. 
    # Divides ship volume by equip volume and returns liquid cube in % format

end