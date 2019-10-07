class Airport
  DEFAULT_CAPACITY = 5
  attr_accessor :capacity
  def initialize(input = DEFAULT_CAPACITY)
    @planes, @capacity = [], input
  end

  def conditions(input = 'sunny')
    @weather = input
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

    for i in (0...@planes.count)
      if @planes[i] == plane
        plane_tempory = @planes[i]
        @planes.delete_at(i)
      end
    end
    plane_tempory
  end
  private
  def full?
    @planes.count >= @capacity
  end

  def weather?
    @weather == 'stormy'
  end
end
