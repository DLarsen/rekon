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
#  level      :integer
#  sequence   :integer
#

class Section < ActiveRecord::Base

  has_many :prompts, -> { order('sequence asc')} # we will want a way to get top-level prompts OR our entry points are sub-sections
  belongs_to :flow

  belongs_to :parent, :class_name => "Section"  # recursive relationship
  has_many :children, -> { order('sequence asc')}, :class_name => "Section",
    :foreign_key => "parent_id"

  def to_s
    self.to_json
  end

  def top_section
    case level
    when 1
      self
    when 2
      parent
    when 3
      parent.parent
    end
  end

  def sub_section
    case level
    when 1
      nil
    when 2
      self
    when 3
      parent
    end
  end

  def first_child
    case level
    when 1
      children.first
    when 2
      children.first
    when 3
      nil
    end
  end

  def next_sibling
    case level
    when 1
      flow.sections.where("sequence > ? AND level = 1", sequence).first
    when 2
      parent.children.where("sequence > ? AND parent_id = ?", sequence, parent_id).first
    when 3
      parent
    end
  end

  def first_prompt
    if first_child
      first_child.prompts.first
    else
      nil
    end
  end
end
