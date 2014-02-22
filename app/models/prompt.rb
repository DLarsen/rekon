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

class Prompt < ActiveRecord::Base

  serialize :suggested_answers
  serialize :dependencies

  belongs_to :section

  # We may not want to have IDs... maybe slugs
  def prompts_for_dependencies
    #hardcode for now
    d = [
      "p:32:*",
      "p:45:yes",
      "p:22:yes p:23:no AND"
    ]
    prompt_ids = d.map{|x|x.scan(/p:\d+/)}
      .flatten
      .uniq
      .map{|x| x[2..-1].to_i}

    Prompt.find(prompt_ids)
  end

end
