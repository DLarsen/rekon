# == Schema Information
#
# Table name: replies
#
#  id             :integer          not null, primary key
#  prompt_id      :integer
#  answer         :text
#  created_at     :datetime
#  updated_at     :datetime
#  project_id     :integer
#  complete       :boolean
#  skipped        :boolean          default(FALSE)
#  not_applicable :boolean          default(FALSE)
#

class Reply < ActiveRecord::Base
  belongs_to :prompt
  belongs_to :project

  def complete?
    true
  end
end
