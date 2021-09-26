class Airport
  def initialize(airport, hangar = Array.new(0) { "string" })
    @aiport = airport
    @hangar = hangar
  end

  def space?
    return @hangar if @hangar.length.zero?
  end

  def add_plane(plane)
    @hangar.push(plane)
  end

  def status
    @hangar
  end

  def remove_plane(plane)
    @hangar - [plane]
  end

end
