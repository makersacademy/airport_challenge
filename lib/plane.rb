class Plane
  attr_reader :landed, :passengers

  def initialize
    @landed = false
    @passengers = []
  end

  def land(airport)
    @landed = true
  #  airport.planes.push(Plane.new)
  end

  def confirm_landed
    if @landed == true
      puts "The plane has landed"
    else
      puts "The plane has yet to land"
    end
  end

  def take_off
    @landed = false
  end

  def confirm_taken_off
    if @landed == false
      puts "The plane has taken off"
    else
      puts "The plane has yet to take off"
    end
  end

end
