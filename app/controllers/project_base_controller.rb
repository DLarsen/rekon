class ProjectBaseController < ApplicationController

  helper_method :current_project

  before_action :nav_sections
  before_action :set_minimap

  def current_flow
    current_project.flow
  end

  def current_project
    #TODO Make this safe
    @current_project ||= Project.find(session[:project_id]) if session[:project_id]
  end

  private
    # set the nav sections
    def nav_sections
      @nav_sections = current_flow.sections.where(parent_id: nil)
    end

    # get the minimap details
    def set_minimap
      reply = false
      if flash[:reply_exclude]
        reply = flash[:reply_exclude]
      end

      logger.fatal "the reply is: #{reply}"
      @minimap = {
        completed: Reply.project_completed(session[:project_id], reply),
        added: reply ? Reply.find(reply) : false
      }
      logger.fatal @minimap
    end

end