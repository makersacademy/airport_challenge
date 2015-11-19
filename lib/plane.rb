require_relative 'airport'

class Plane

  def initialize
    @flying = true
  end

  def land(airport)
    fail 'Plane cannot land: plane is already landed.' if landed
    @flying = false
    @airport = airport
  end

  def take_off
    fail 'Plane cannot take off: plane is already flying.' if flying
    @flying = true
  end

  def airport
    fail 'Plane cannot be at the airport: plane is already flying.' if flying
    @airport
  end

  private

    attr_reader :flying

    def landed
      !flying
    end
end
