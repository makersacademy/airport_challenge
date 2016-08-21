module Planes

  def plane?
    self.is_a? Plane
  end

  def take_off
    raise "stormy day, no flying" if stormy?
    @planes.pop
  end

  def land(arg)
    raise "airport full, find another lol" if full?
    raise "plane already landed" if @planes.include?(arg)
    raise "pass in plane objects only" unless arg.plane?
    raise "stormy day, no flying" if stormy?
    @planes << arg
  end


end
