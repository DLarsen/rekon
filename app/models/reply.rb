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

  # relationships
  belongs_to :prompt
  belongs_to :project

  # FIXME: dave is this needed now?
  def complete?
    complete == true
  end

  # gets returns the completed replies for a project
  # optionally can exclude by id
  def self.project_completed(project_id, exclude_id = nil)
    where_string = 'project_id = ? AND complete = ?'
    if exclude_id
      where_string << ' AND id != ?'
      where where_string, project_id, true, exclude_id
    else
      where where_string, project_id, true
    end
  end

end
