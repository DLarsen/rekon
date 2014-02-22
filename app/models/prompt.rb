class Prompt

  attr_accessible :id

  # we potentially want "top" for UI purposes
  attr_accessible :top_section
  attr_accessible :section

  # 0 is first, million is last
  attr_accessible :sequence

  #What is the primary type of input?
  attr_accessible :type

  attr_accessible :instructions

  # for checkbox or radio prompts, we have an array
  attr_accessible :suggested_answers

  attr_accessible :multi_response?

  # an array of strings, which get parsed out by meets_dependencies?
  attr_accessible :dependencies

  # needs awareness of the current flow... so maybe we have a separate mechanism to evaluate dependencies
  def meets_dependencies?
    false
  end

end