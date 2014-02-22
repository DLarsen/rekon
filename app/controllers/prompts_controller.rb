class PromptsController < ProjectBaseController

  def index
    @prompts = Prompt.all
    @replies = Hash[current_project.replies.where.not(complete?:true).map{|r| [r.prompt.id, r]}]
  end

  def show
    @prompt = Prompt.find(params[:id])
  end

end