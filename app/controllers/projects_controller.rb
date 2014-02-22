class ProjectsController < ApplicationController

  def select
    session[:project_id] = current_user.projects.find(params[:id]).id
    redirect_to sections_path
  end

end
