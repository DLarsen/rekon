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
#  level      :ingeter
#  sequence   :ingeter
#

class Section < ActiveRecord::Base
  # we will want a way to get top-level prompts OR our entry points are sub-sections
  has_many :prompts, -> { order('sequence desc')}
  belongs_to :flow

  has_many :children, :class_name => "Section",
    :foreign_key => "parent_id", -> { order('sequence desc')}
  belongs_to :parent, :class_name => "Section"

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

  def next_section
    case level
    when 1
      nil
    when 2
      self
    when 3
      parent
    end
  end
end
