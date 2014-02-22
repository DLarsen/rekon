class DependencyChecker

  def initialize(prompt)
    @root_prompt = prompt
  end

  def fulfilled_for(project)
    related = @root_prompt.prompt_ids_for_dependencies
    replies = project.replies.where("prompt_id in (?)", related)

    dependencies = @root_prompt.dependencies
    i = 0
    passes = true
    loop do

      d = Dependency.new(dependencies[i])
      tokens

      i += 1
      break if (i < dependencies.size && passes)
    end
  end

  def self.test
    p = Prompt.first
    r = Project.first
    DependencyChecker.new(p).fulfilled_for(r)
  end

end