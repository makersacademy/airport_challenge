require_relative "Plane"

class AirTrafficController
  attr_accessor :plane , :hanger , :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
  end

  def plane_landing(plane)
    raise "hanger full" if full?
    @hanger << plane
  end

  def plane_taking_off(plane)
    @hanger.each do |e| if e == plane
      @hanger.delete_at(e)
    end
    end
  end

  def full?
    @hanger.count >= capacity
  end
end
