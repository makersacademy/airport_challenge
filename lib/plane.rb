class Plane

  def land_plane
    p "What are the instructions for the plane?"
    instruction = gets.chomp 
    p instruction
  end

  def take_off_plane
    p "What are the instructions for the plane?"
    instructions = gets.chomp 
    p instructions

  end

  def has_plane_left?
    p "has plane left"
    if instructions = true 
      p true
    else
      p "no. Plane is still here"
    end
  end

  def full_capacity?
    airport = Airport.new
    airport.full_capacity?
  end




end

