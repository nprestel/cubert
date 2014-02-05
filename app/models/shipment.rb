class Shipment < ActiveRecord::Base
  belongs_to :equipment
  has_many :pieces, :dependent => :destroy
  has_one :equipment
  
  accepts_nested_attributes_for :pieces, :reject_if => lambda { |a| a.weight.blank? }, :allow_destroy => true
  include ActionView::Helpers::NumberHelper
  
  
  
  # def piece_attributes=(piece_attributes)
  #   piece_attributes.each do |attributes|
  #     pieces.build(attributes)
  #   end
  # end
        
    
  def gross_weight_lbs
      self.pieces.sum(:weight_lbs)
    end

end
