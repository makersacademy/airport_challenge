# require './airport'
# require './plane'

# ATC = Air Traffic Controller
class ATC

  def land_plane(airport, plane)
  @airport = airport
  @plane = plane
  puts @plane + " landed @ " + @airport + " airport."
  end

  def takeoff_plane(airport, plane)
    true

  end

  def prevent_landing(airport)
    true
  
  end

end



# jim = ATC.new
# jim.land_plane("Heathrow", "airbus1")