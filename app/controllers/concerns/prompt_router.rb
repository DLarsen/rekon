module PromptRouter
  include ActiveSupport::Concerns

  def next_prompt(project, section)
    if section.nil?
      ::Rails.logger.info "WE HAVE A NIL SECTION"
      return nil
    end
    if section.prompts.size > 0
      ::Rails.logger.info "WE HAVE PROMPTS for section #{section.id}"
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
      if section.next_sibling
        next_prompt(project, section.next_sibling)
      else
        next_prompt(project, section.parent.next_sibling)
      end

    else
      puts "WE HAVE NO PROMPTS for section #{section.id}"
      if section.children.size > 0
        ::Rails.logger.info "  WE HAVE NO CHILDREN"
        next_prompt(project, section.children.first)
      else
        ::Rails.logger.info "  WE HAVE CHILDREN"
        next_prompt(project, section.next_sibling)
      end
    end

  end
end