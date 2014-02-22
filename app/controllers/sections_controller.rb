class SectionsController < FlowBaseController

  def index
    @prompts = Prompt.all
  end

  def show
    @prompt = Prompt.first
  end

end