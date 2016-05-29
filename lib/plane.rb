require_relative 'airport'

class Plane

  def land airport
    raise "You are not flying Fool!" if self.landed?
    raise "It's raining Fool!" if airport.stormy
    @landed = true
    return self
  end

  def landed?
    @landed
  end


  def take_off airport
    raise "You are flying Fool!" if self.landed? == false
    raise "It's raining Fool!" if airport.stormy
    @landed = false
    return self
  end

  private

  attr_reader :landed


end