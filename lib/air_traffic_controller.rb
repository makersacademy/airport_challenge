require_relative 'airport'
require_relative 'plane'

class AirTrafficController

  attr_reader :plane_to_instruct

  def initialize(plane=nil)
    @plane_to_instruct = plane
  end

  def instruct_to_land
    @plane_to_instruct.landing = true unless !@plane_to_instruct
  end

  def instruct_to_take_off
    
  end

end
