require_relative 'airport'

class Plane
  def land(plane)
    puts @airport << plane
    land_confirm
  end

  def take_off
    "Plane taken off! No longer at airport."
  end

end
