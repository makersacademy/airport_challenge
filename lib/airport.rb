require 'plane'
require 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  # DEFAULT_WEATHER = ['stormy', 'sunny']
  attr_accessor :hanger, :capacity , :weather

  def initialize(capacity = DEFAULT_CAPACITY) #, weather = DEFAULT_WEATHER)
    @hanger = []
    @capacity = capacity
    @weather = nil
  end

  def land_plane(plane)
    raise "Unsuitable landing conditions." if stormy?
    raise "Hanger is full." if full?
    hanger << plane
  end

  def take_off_plane(plane)
    raise "Unsuitable take off conditions." if stormy?
    index = search_for_plane(plane)
    hanger.delete_at(index)
    puts "#{plane} has left the hanger..."
  end

  def search_for_plane(plane)
    i = 0
    hanger.each do |current_plane|
      if current_plane == plane
        break
      else
        i += 1
      end
    end
    return i
  end

  def full?
    hanger.count >= capacity
  end

  def stormy?
    @weather == 'stormy'
  end
end
