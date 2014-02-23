# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  prompt_id  :integer
#  answer     :text
#  created_at :datetime
#  updated_at :datetime
#  project_id :integer
#

class Reply < ActiveRecord::Base

  # relationships
  belongs_to :prompt
  belongs_to :project

  def complete?
    complete == true
  end

end
