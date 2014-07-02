# == Schema Information
#
# Table name: containers
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  length_ins         :float
#  width_ins          :float
#  height_ins         :float
#  max_stack_wt_lbs   :float
#  RRR_IB             :integer
#  RRR_OB             :integer
#  lock_length        :boolean
#  lock_width         :boolean
#  do_not_delete      :boolean          default(FALSE)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Container < ActiveRecord::Base
end
