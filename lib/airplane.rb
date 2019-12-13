class Airplane
  def land_at(airport)
    raise("Airport is full") if airport.dispatch_plane != nil
    
    @location = airport
  end

  def takeoff
    @location = "sky"
  end
end
