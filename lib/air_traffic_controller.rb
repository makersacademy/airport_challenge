require_relative "Plane"

class AirTrafficController
  attr_accessor :plane , :hanger

  def initialize
    @hanger = []
  end

  def plane_landing(plane)
    @hanger << plane
  end

  def plane_taking_off(plane)
    @hanger.each do |e| if e == plane
      @hanger.delete_at(e)
    end
    end
  end

  def hanger_full

  end
end
