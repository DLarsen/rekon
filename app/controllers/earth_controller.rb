# This is David's throwaway controller
class EarthController < FlowBaseController

  def index
    @flow = current_flow
  end

end