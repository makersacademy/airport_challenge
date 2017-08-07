class Plane

  attr_accessor :airport, :status

  def initialize(airport = nil)
    @airport = airport
    @airport == nil ? @status = :in_the_air : @status = :on_the_ground
  end

  def land(airport)
    raise "already landed at this airport" if @airport == airport
    raise "already landed at another airport" if @airport != nil && @airport != airport
    raise "too stormy to land" if airport.get_weather == :stormy
    raise "unable to land as airport is full" if airport.full? == true
    @status = :on_the_ground
    @airport = airport
    airport.receive_plane
    "plane has landed"
  end

  def take_off(airport)
    raise "already flying" if @status == :in_the_air
    raise "not at this airport" if @airport != airport
    raise "too stormy to fly" if airport.get_weather == :stormy
    @status = :in_the_air
    @airport = nil
    airport.remove_plane
    "plane has taken off"
  end

end
