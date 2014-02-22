# == Schema Information
#
# Table name: prompts
#
#  id                :integer          not null, primary key
#  section_id        :integer
#  sequence          :integer
#  type_of           :string(32)
#  instructions      :text
#  suggested_answers :text
#  multi_response?   :boolean
#  dependencies      :text
#  created_at        :datetime
#  updated_at        :datetime
#  slug              :string(255)
#  details           :text
#  hint              :text
#

class Prompt < ActiveRecord::Base

  # relationships
  has_many :replies
  belongs_to :section

  serialize :suggested_answers
  serialize :dependencies

  # We may not want to have IDs... maybe slugs
  def prompt_ids_for_dependencies
    #hardcode for now
    d = [
      "p:a:*",
      "p:b:yes",
      "p:c:yes p:d:no AND"
    ]
    prompt_slugs = d.map{|x|x.scan(/p:\d+/)}
      .flatten
      .uniq
      .map{|x| x[2..-1]}

    Prompt.where("slug in (?)", prompt_slugs).pluck(:id)
  end

  def top_section
    if section.parent
      if section.parent.parent
        section.parent.parent
      else
        section.parent
      end
    else
      section
    end
  end

end
