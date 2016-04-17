class Airport

  DEFAULT_CAPACITY = 20
  NOT_FOUND = "plane not at airport".freeze
  LANDED = "plane alreay on ground".freeze
  STORMY = "stormy weather".freeze
  FULL = "capacity full".freeze

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def takeoff(plane)
    check_errors(plane, false)
    plane.takeoff
    leave_airport(plane)
  end

  def land(plane)
    check_errors(plane, true)
    plane.land
    access_airport(plane)
  end

  def stormy?
      weather_generator == 9
  end

  private

    def in_airport?(plane)
      planes.include?(plane)
    end

    def access_airport(plane)
      planes << plane
    end

    def leave_airport(plane)
      planes.delete(plane)
    end

    def check_errors(plane,land)
      if land
        fail LANDED if in_airport?(plane)
      else
        fail NOT_FOUND if !in_airport?(plane)
      end
      fail STORMY if stormy?
      fail FULL  if full?
    end

    def weather_generator
      rand(10)
    end

    def full?
      planes.count >= capacity
    end
end
