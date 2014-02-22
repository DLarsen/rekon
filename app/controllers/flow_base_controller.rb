class FlowBaseController < ApplicationController

  helper_method :current_project


  def current_flow
    Flow.first
  end

  def current_project
    Project.new(name:"Teri Larsen CPA")
  end

end