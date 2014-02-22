class FlowBaseController < ApplicationController

  helper_method :current_project


  def current_flow
    current_project.flow
  end

  def current_project
    Project.first
  end

end