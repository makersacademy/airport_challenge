class Plane

  def land(airport)
    @airport = airport
    @airport.dock << self
    # puts "#{airport.dock}"
  end

  def takeoff
    @airport.dock.delete(self)
  end

end