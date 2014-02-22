class PromptsController < FlowBaseController

  def index
    @prompts = Prompt.all
  end

  def show
    @prompt = Prompt.find(params[:id])
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
