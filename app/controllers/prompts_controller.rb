class PromptsController < ProjectBaseController

  before_action :set_prompt, only: [:show, :update]

  def index
    @prompts = Prompt.all
    @replies = Hash[current_project.replies.where.not(complete?:true).map{|r| [r.prompt.id, r]}]
  end

  # GET /blars/1
  # GET /blars/1.json
  def show
    @top_section = @prompt.top_section
    set_replies(@prompt)
  end

  # PATCH/PUT /prompts/1
  # PATCH/PUT /prompts/1.json
  def update
    respond_to do |format|
      if @prompt.update(prompt_params)
        format.html { redirect_to @prompt, notice: 'Prompt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @prompt.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prompt
      @prompt = Prompt.find(params[:id])
    end

    # initialize at least (1) reply for prompt if not set
    def set_replies(prompt)
      if prompt.replies.length == 0
        prompt.replies.build
      elsif prompt.replies.length > 1
        prompt.replies = [prompt.replies.last]
      end
    end

end
