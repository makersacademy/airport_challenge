require_relative 'passenger'

class Airport

  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @people = []
    DEFAULT_PASSENGERS.times { @people << Passenger.new }
    # puts "#{DEFAULT_PASSENGERS} passengers waiting at the airport"
    @planes = []
    @capacity = capacity
    @badweather = false
  end

  def full?
    @planes.length == @capacity ? true : false
  end

  def badweather?
    checkweather
    @badweather
  end

  def land(plane)
    fail "No space for plane to land!" if full?
    fail "Plane can't land, it isn't airborn!" if plane.landed?
    fail "Bad weather stops planes landing!" if badweather? == true
    plane.land
    @planes << plane
  end

  def takeoff(plane)
    fail 'Plane is not available' if (@planes.include?(plane) == false)
    fail "Bad weather stops planes taking off!" if badweather? == true
    plane.takeoff
    @planes.delete(plane)
  end

  def board(plane)
    fail "#{plane} is not currently landed at this airport!" if (@planes.include?(plane) == false)
    (plane.space > @people.count ? @people.count : plane.space).times { plane.board(@people.pop) }
  end

  def alight(plane)
    fail "#{plane} is not currently landed at this airport!" if (@planes.include?(plane) == false)
    plane.people.count.times { @people << plane.alight }
  end

  private

    def checkweather
      @badweather = (rand(6) > 4 ? true : false)
    end

    DEFAULT_PASSENGERS = 20
    DEFAULT_CAPACITY = 5

    attr_reader :people

end
