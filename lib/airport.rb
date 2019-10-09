class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :capacity
  def initialize(input = DEFAULT_CAPACITY)
    @planes, @capacity = [], input
  end

  def conditions
    conditions = ['stormy', 'clear']
    @weather = conditions[rand(2)]
  end

  def inventory
    @planes
  end

  def land(plane)
    fail 'no room' if full?
    fail 'bad weather' if weather?

    @planes << plane
  end

  def takeoff(plane)
    fail 'bad weather' if weather?

    temp_plane = nil
    @planes.each do |plane_|
      if plane_ == plane
        temp_plane = plane_
        @planes.delete(plane_)
      end
    end
    temp_plane
  end
  
  def full?
    @planes.count >= @capacity
  end

  def weather?
    @weather == 'stormy'
  end
end
