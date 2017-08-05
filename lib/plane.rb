class Plane

  attr_accessor :airport, :status

  def initialize(airport = nil)
    @airport = airport
    if @airport == nil
      @status = "in the air"
    else
      @status = "on the ground"
    end
  end

  def land(airport)
    if @status == "on the ground"
      if airport == @airport
        raise "already landed at this airport"
      else
        raise "already landed at another airport"
      end
    elsif airport.weather == "stormy"
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
    if @status == "in the air"
      raise "already flying"
    elsif airport.weather == "stormy"
      "too stormy to fly"
    else
      @status = "in the air"
      @airport = nil
      "plane has taken off"
    end
  end

end
