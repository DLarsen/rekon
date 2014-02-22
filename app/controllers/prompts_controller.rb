class PromptsController < ProjectBaseController

  def index
    @prompts = Prompt.all
    @replies = Hash[current_project.replies.where.not(complete?:true).map{|r| [r.prompt.id, r]}]
  end

  def show
    @prompt = Prompt.find(params[:id])
    @top_section = @prompt.top_section
    set_replies(@prompt)
  end

  private

  # initialize at least (1) reply for prompt if not set
  def set_replies(prompt)
    if prompt.replies.length == 0
      prompt.replies.build
    elsif prompt.replies.length > 1
      prompt.replies = [prompt.replies.last]
    end
  end

end
