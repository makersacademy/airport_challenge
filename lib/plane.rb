class Plane

  attr_accessor :airport, :status

  def initialize(airport = nil)
    @airport = airport
    @airport == nil ? @status = "in the air" : @status = "on the ground"
  end

  def land(airport)
    raise "already landed at this airport" if @status == "on the ground" && airport == @airport
    raise "already landed at another airport" if @status == "on the ground" && airport != @airport
    if airport.weather == "stormy"
      "too stormy to land"
    elsif airport.full == true
      "unable to land as airport is full"
    else
      @status = "on the ground"
      @airport = airport
      "plane has landed"
    end
  end

  def take_off
    raise "already flying" if @status == "in the air"
    if airport.weather == "stormy"
      "too stormy to fly"
    else
      @status = "in the air"
      @airport = nil
      "plane has taken off"
    end
  end

end
