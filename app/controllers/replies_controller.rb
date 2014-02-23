class RepliesController < ProjectBaseController

  before_action :set_reply, only: [:update]


  include PromptRouter

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(reply_params)

    respond_to do |format|
      if @reply.save
        format.html do
          n = next_prompt(current_project, @reply.prompt.section)
          redirect_to prompt_url(n.id), notice: 'Reply was successfully created.'
        end
        format.json { render action: 'show', status: :created, location: @reply }
      else
        format.html { render action: 'new' }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)

        n = next_prompt(current_project, @reply.prompt.section)

        format.html { redirect_to prompt_url(n.id), notice: 'Reply was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      if params[:reply][:answer].kind_of?(Hash)
        params[:reply][:answer] = params[:reply][:answer].values.join('|')
      elsif !params[:reply][:answer_other].blank?
        params[:reply][:answer] = params[:reply][:answer_other]
      end


      params[:reply][:project_id] = current_project


      params.require(:reply).permit(
        :project_id,
        :prompt_id,
        :answer,
        :skipped,
        :not_applicable
      )

    end



end
