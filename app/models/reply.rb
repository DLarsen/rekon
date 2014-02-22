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
  belongs_to :prompt

  def complete?
    true
  end
end
