class Plane
  def land(airport, stormy)
    if stormy && airport.full?
      puts "Landing aborted: Stormy and Airport full"
    elsif stormy
      puts "Landing aborted: Stormy."
    elsif airport.full?
      puts "Landing aborted: Airport full."
    else
      airport.landed_planes << self
    end  
  end

  def take_off(airport, stormy)
    if stormy
      puts "Take-off aborted."
    else
      
    end
  end
end
