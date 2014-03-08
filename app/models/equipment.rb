# == Schema Information
#
# Table name: equipment
#
#  id                       :integer          not null, primary key
#  equip_name               :string(255)
#  description              :text
#  mode                     :string(255)
#  wt_limit_lbs             :float
#  cb_limit_cuft            :float
#  length1_ins              :float
#  width1_ins               :float
#  height1_ins              :float
#  length2_ins              :float
#  width2_ins               :float
#  height2_ins              :float
#  length3_ins              :float
#  width3_ins               :float
#  height3_ins              :float
#  created_at               :datetime
#  updated_at               :datetime
#  equip_image_file_name    :string(255)
#  equip_image_content_type :string(255)
#  equip_image_file_size    :integer
#  equip_image_updated_at   :datetime
#

class Equipment < ActiveRecord::Base
  belongs_to :shipments

  MODE_TYPES = ["Ground", "Air", "Ocean"]
  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :equip_image,
    :styles => { :medium => ["500x500", :jpg], :thumb => ["100x100", :jpg] },
    :storage => :s3,
    :bucket => 'lajek_images',
    :s3_host_name => 's3.amazonaws.com',
    :s3_credentials => {
      :access_key_id => ENV["CUBERT_AWSKEYID"],
      :secret_access_key => ENV["CUBERT_AWSSECRETKEY"]
    }
  validates :equip_name, :description, :mode, presence: true
  validates :equip_name, uniqueness: { case_sensitive: false }
  validates :length1_ins, numericality: {greater_than_or_equal_to:0.01}
  validates :width1_ins, numericality: {greater_than_or_equal_to:0.01}
  validates :height1_ins, numericality: {greater_than_or_equal_to:0.01}

  before_validation :uppercase_equip_name

  validates_numericality_of :wt_limit_lbs
  validates_numericality_of :cb_limit_cuft
  #validate :less_than_calculated_cube
  #def less_than_calculated_cube
   #errors.add(:cb_limit_cuft, "Larger than product of provided dims") unless cb_limit_cuft < ((length1_ins*width1_ins*height1_ins)+(length2_ins*width2_ins*height2_ins)+(length3_ins*width3_ins*height3_ins))
  #end

  def uppercase_equip_name
    self.equip_name.upcase!
  end

end
