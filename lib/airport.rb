require_relative 'plane'

class Airport

  def land
    land_confirm
  end

  def land_confirm
    puts "Plane landed!"
  end

  def take_off
    take_off_confirm
  end

  def take_off_confirm
    puts "Plane taken off! No longer at airport."
  end

end
