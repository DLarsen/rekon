class PromptSelector

  def self.next(project, section)
    if section.prompts.size
      # we have stuff
      replies = project.replies.where("prompt_id in (?)", section.prompts.map(&:id))
    else
      # drill down
    end
    replies = project.replies
  end



end