class Plane

  attr_accessor :airport, :status

  def initialize(airport = nil)
    @airport = airport
    @airport == nil ? @status = :in_the_air : @status = :on_the_ground
  end

  def land(airport)
    raise "already landed at this airport" if @status == :on_the_ground && airport == @airport
    raise "already landed at another airport" if @status == :on_the_ground && airport != @airport
    if airport.get_weather == :stormy
      "too stormy to land"
    elsif airport.full == true
      "unable to land as airport is full"
    else
      @status = :on_the_ground
      @airport = airport
      "plane has landed"
    end
  end

  def take_off
    raise "already flying" if @status == :in_the_air
    if airport.get_weather == :stormy
      "too stormy to fly"
    else
      @status = :in_the_air
      @airport = nil
      "plane has taken off"
    end
  end

end
