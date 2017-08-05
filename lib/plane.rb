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
    elsif airport.planes == airport.capacity
      "unable to land as airport is full"
    else
      @status = :on_the_ground
      @airport = airport
      airport.receive_plane
      "plane has landed"
    end
  end

  def take_off(airport)
    raise "already flying" if @status == :in_the_air
    raise "not at this airport" if @airport != airport
    if airport.get_weather == :stormy
      "too stormy to fly"
    else
      @status = :in_the_air
      @airport = nil
      airport.remove_plane
      "plane has taken off"
    end
  end

end
