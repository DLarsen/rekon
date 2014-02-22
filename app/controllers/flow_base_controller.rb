class FlowBaseController < ApplicationController

  def current_flow
    Flow.new
  end

end