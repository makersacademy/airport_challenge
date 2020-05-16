require_relative 'airport'

class Plane
  def land(airport)
    airport.recieve_plane(self)
    @airport = airport
  end

  def take_off
    @airport.take_off_plane(self)
    take_off_confirmation
  end

  private

  def take_off_confirmation
    return if @airport.planes.include?(self)

    puts "[plane is no longer at airport]"
    @airport = ""
  end
end
