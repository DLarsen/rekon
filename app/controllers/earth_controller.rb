# This is David's throwaway controller
class EarthController < ProjectBaseController

  def index
    @flow = current_flow
  end

end