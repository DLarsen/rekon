# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  flow_id    :integer
#  parent_id  :integer
#

class Section < ActiveRecord::Base

  # relationships
  has_many :prompts # we will want a way to get top-level prompts OR our entry points are sub-sections
  belongs_to :flow
  belongs_to :parent, :class_name => "Section" # recursive relationship
  has_many :children, :class_name => "Section", :foreign_key => "parent_id"

  def top_section
    if parent
      parent
    else
      self
    end
  end

  def sub_section
    self
  end
end
