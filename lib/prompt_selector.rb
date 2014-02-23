class PromptSelector

  def self.next(project, section)
    if section.prompts.size
      prompts = section.prompts
      # we have stuff
      replies = Hash[project
                  .replies
                  .where("prompt_id in (?)", section.prompts.map(&:id))
                  .map{|x| [x.prompt_id, x]}]

      puts prompts.to_json

      puts "---"
      puts project.to_json

      puts "---"
      puts replies.to_json

      i = 0
      done = false
      loop do
        p = prompts[i]
        done = replies[p.id].nil?

        return p if (done)
        i += 1
        break unless i < prompts.size
      end

    else
      # drill down
    end
    replies = project.replies
  end

  def self.next_after_prompt(project, section)
    raise 'all hell'
  end

  def self.tests
    puts  PromptSelector.test1 ? "PASS" : "FAIL"
  end

  def self.test1

    project = Project.new
    project.replies = [
      Reply.new(prompt_id:1, answer: "OK"),
      ]

    prompts = (1..3).map {|prompt_id| Prompt.new(id:prompt_id) }
    section = Section.new(prompts: prompts)

    result = PromptSelector.next(project, section)
    puts "bing => #{result.id}"
    result.id == 2
  end

end