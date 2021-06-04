class Airport

  attr_reader :plane, :hangar

  def initialize(hangar_cap = 2)
    @plane
    @hangar = []
    @hangar_cap = hangar_cap
  end

  def make_plane
    @plane = Plane.new
  end

  def land_plane
    raise "No space in hangar" unless @hangar.length < @hangar_cap
    @hangar << @plane
  end

  def take_off
    @hangar.empty? ? "No planes in hangar" : "Planes in hangar: #{@hangar.length}"
    @hangar.pop
  end

end


class Plane
  def working?
    true
  end
end