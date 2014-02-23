class SectionsController < ProjectBaseController

  include PromptRouter

  def index
    @sections = current_flow.sections.where(parent_id: nil)
    @status = Hash[current_project.section_statuses.map{|s| [s.section.id, s]}]
  end

  def show
    @section = current_flow.sections.find(params[:id])

    # if @section.level == 1 && @section.first_child
    #   redirect_to @section.first_child
    # else
    if @section.children.size == 0 && @section.prompts.size > 0
      n = next_prompt(current_project, @section)
      redirect_to prompt_url(n.id)
    else
      @top_section = @section.top_section
      @sub_section = @section.sub_section
      @status = Hash[current_project.section_statuses.map{|s| [s.section.id, s]}]
    end

  end

end