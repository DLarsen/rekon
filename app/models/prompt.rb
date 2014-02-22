# == Schema Information
#
# Table name: prompts
#
#  id                :integer          not null, primary key
#  section_id        :integer
#  sequence          :integer
#  type              :string(32)
#  instructions      :text
#  suggested_answers :text
#  multi_response?   :boolean
#  dependencies      :text
#  created_at        :datetime
#  updated_at        :datetime
#  slug              :string(255)
#

class Prompt < ActiveRecord::Base

  serialize :suggested_answers
  serialize :dependencies

  belongs_to :section

  # We may not want to have IDs... maybe slugs
  def prompts_for_dependencies
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

    Prompt.where("slug in (?)", prompt_slugs)
  end

end
