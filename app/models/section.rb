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
#

class Section < ActiveRecord::Base
  # we will want a way to get top-level prompts OR our entry points are sub-sections
  has_many :prompts
  belongs_to :flow

  has_many :children, :class_name => "Section",
    :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Section"

end
