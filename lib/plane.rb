class Plane

  attr_reader :airport

  def initialize(airport = nil)
    @airport = airport
  end

  def land(airport)
    raise "The plane has already landed!" if @airport != nil
    if airport.request_to_land(self)
      @airport = airport
      true
    else
      false
    end
  end

  def take_off(airport)
    raise "The plane has already taken off!" if @airport == nil
    raise "The plane is in another airport!" if airport != @airport
    if airport.request_take_off(self)
      @airport = nil
      true
    else
      false
    end
  end


end
