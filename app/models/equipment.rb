class Equipment < ActiveRecord::Base
  MODE_TYPES = ["", "Ground", "Air", "Ocean"]
  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :equip_image,
    :styles => { :medium => ["500x500", :jpg], :thumb => ["100x100", :jpg] },
    :storage => :s3,
    :bucket => 'lajek_images',
    :s3_host_name => 's3.amazonaws.com',
    :s3_credentials => {
      :access_key_id => 'AKIAIYNX67DR4R3QOS3A',
      :secret_access_key => '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'
    }
  validates :name, :description, :mode, presence: true 
  validates :length1_ins, numericality: {greater_than_or_equal_to:0.01}
  validates :width1_ins, numericality: {greater_than_or_equal_to:0.01}
  validates :height1_ins, numericality: {greater_than_or_equal_to:0.01}

  validates_numericality_of :wt_limit_lbs
  validates_numericality_of :cb_limit_cuft
  #validate :less_than_calculated_cube
  #def less_than_calculated_cube
   #errors.add(:cb_limit_cuft, "Larger than product of provided dims") unless cb_limit_cuft < ((length1_ins*width1_ins*height1_ins)+(length2_ins*width2_ins*height2_ins)+(length3_ins*width3_ins*height3_ins))
  #end
  
  validates :name, uniqueness: true
end
