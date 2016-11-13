
class Airport

  def initialize
    @confirm = true


  def land_plane(plane)
    puts "This plane has landed"
    @confirm = false
  end

  def take_off(plane)
    puts "All clear for take off!"
    @confirm
  end

  def confirm(plane)
    true
  end

end

class Plane

end
