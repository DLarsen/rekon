# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  flow_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base

  # relationships
  belongs_to :flow
  has_many :replies
  has_many :section_statuses

  def update_section_status(section)
    number_of_prompts = section.prompts.count
    number_of_responses = replies.where("prompt_id in (?)", section.prompts.pluck(:id)).count
    section.children.each do |s|
      number_of_prompts += s.prompts.count
      number_of_responses += replies.where("prompt_id in (?)", s.prompts.pluck(:id)).count
    end



  end

end
