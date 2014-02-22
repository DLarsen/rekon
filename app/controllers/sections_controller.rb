class SectionsController < ProjectBaseController

  def index
    @sections = current_flow.sections.where(parent_id: nil)
    @status = Hash[current_project.section_statuses.map{|s| [s.section.id, s]}]
  end

  def show
    @section = current_flow.sections.find(params[:id])
    @top_section = @section.top_section
    @status = Hash[current_project.section_statuses.map{|s| [s.section.id, s]}]
  end

end