class SectionsController < FlowBaseController

  def index
    @sections = current_flow.sections.all
  end

  def show
    @section = current_flow.sections.find(params[:id])
  end

end