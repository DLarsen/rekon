class ProjectBaseController < ApplicationController

  helper_method :current_project

  before_action :nav_sections

  def current_flow
    current_project.flow
  end

  def current_project
    #TODO Make this safe
    @current_project ||= Project.find(session[:project_id]) if session[:project_id]
  end

  private
  def nav_sections
    @nav_sections = current_flow.sections.where(parent_id: nil)
  end

end