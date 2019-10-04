class Airport
  DEFAULT_CAPACITY = 20
  DEFAULT_WEATHER = 'sunny'
  attr_accessor :hanger, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY, weather = DEFAULT_WEATHER)
    @hanger = []
    @capacity = capacity
    @weather = weather
  end

  def land_plane(plane)
    raise "Unsuitable landing conditions." if stormy?
    raise "Hanger is full." if full?
    hanger << plane
  end

  def take_off_plane(plane)
    raise "Unsuitable take off conditions." if stormy?
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

  def stormy?
    weather == 'stormy'
  end
end

class Plane
end
