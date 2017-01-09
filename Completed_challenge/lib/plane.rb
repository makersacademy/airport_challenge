class Plane

  def parked?
    @parked
  end

  def leave
    @parked = false
    puts "The plain has left the Airport"
  end

  def land
    @parked = true
    puts "The plain is parked in the Airport"
  end

end
