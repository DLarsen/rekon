# == Schema Information
#
# Table name: section_statuses
#
#  id          :integer          not null, primary key
#  project_id  :integer
#  section_id  :integer
#  status_code :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class SectionStatus < ActiveRecord::Base

  EMPTY = 0
  INCOMPLETE = 1
  COMPLETE = 2

  # relationships
  belongs_to :project
  belongs_to :section

  def status
    case status_code
    when EMPTY
      :empty
    when INCOMPLETE
      :incomplete
    when COMPLETE
      :complete
    end
  end

  def is_empty?
    status == :empty
  end

  def is_incomplete?
    status == :incomplete
  end

  def is_complete?
    status == :complete
  end

end
