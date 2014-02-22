class PromptsController < FlowBaseController

  def index
    @prompts = Prompt.all
  end

  def show
    @prompt = Prompt.find(params[:id])
  end

end