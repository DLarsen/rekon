module PromptRouter
  include ActiveSupport::Concerns

  def next_prompt(project, section)
    if section.prompts.size
      prompts = section.prompts.order('sequence desc')
      # we have stuff
      replies = Hash[project
                  .replies
                  .where("prompt_id in (?)", section.prompts.map(&:id))
                  .map{|x| [x.prompt_id, x]}]

      # puts section.to_json

      # puts "---"
      # puts prompts.map(&:id).to_json

      # puts "---"
      # puts project.to_json

      # puts "---"
      # puts replies.to_json

      i = 0
      done = false
      if prompts.size > 0
        loop do
          p = prompts[i]
          done = replies[p.id].nil?

          return p if (done)
          i += 1
          break unless i < prompts.size
        end
      end

      # we found nothing undone... go to next section

    else
      # drill down
    end
    replies = project.replies
  end
end