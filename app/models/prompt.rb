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

  belongs_to :section

end
