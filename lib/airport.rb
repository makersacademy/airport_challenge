class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :hanger, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Hanger is full." if full?
    hanger << plane
  end

  def take_off_plane(plane)
    i = 0
    hanger.each do |current_plane|
      if current_plane == plane
        break
      else
        i += 1
      end
    end
    hanger.delete_at(i)
    puts "#{plane} has left the hanger..."
  end

  def full?
    hanger.count >= capacity
  end
end

class Plane
end
