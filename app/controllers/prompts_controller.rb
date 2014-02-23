class PromptsController < ProjectBaseController

  before_action :set_prompt, only: [:show, :update]

  def index
    @prompts = Prompt.all
    @replies = Hash[current_project.replies.where.not(complete:true).map{|r| [r.prompt.id, r]}]
  end

  # GET /prompts/1
  # GET /prompts/1.json
  def show
    @top_section = @prompt.top_section
    set_replies(@prompt)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prompt
      @prompt = Prompt.find(params[:id])
      logger.fatal @prompt.replies.inspect
      #@prompt.replies = @prompt.replies.where(:prompt_id => @prompt.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prompt_params
      params.require(:prompt).permit(
        :id,
        replies: [
          :id,
          :answer,
          :skipped,
          :not_applicable
        ]
      )
    end

    # initialize at least (1) reply for prompt if not set
    def set_replies(prompt)
      if prompt.replies.length == 0
        @reply = prompt.replies.build
      else
        @reply = prompt.replies.last
      end
    end

end
