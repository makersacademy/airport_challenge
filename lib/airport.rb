require_relative './weather.rb'

class Airport

  attr_reader :weather, :capacity, :name

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY, location = "Mystery City")
    @name = location.to_s + " Airport"
    @planes_in_hangar = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    excuses("land", plane)
    put_in_hangar(plane)
  end

  def takeoff
    excuses("takeoff")
    chocs_away.fly
  end

  def check_hangar
    hangar_empty? ? "The hangar is empty." : return_flight_nos
  end

private

  def excuses(action, object = nil)
    case action
    when "land"
      fail "Sorry, that doesn't seem to be a plane." unless its_a_plane(object)
      rejection = "Landing sequence for #{object.flight_number} rejected:"
      fail "#{rejection} No planes can land in this stormy weather." if stormy
      fail "#{rejection} That plane is actually in a hangar in #{object.location}." if object.in_hangar
      fail "#{rejection} The hangar is full." if hangar_full?
    when "takeoff"
      rejection = "Takeoff rejected:"
      fail "#{rejection} No planes can fly in this stormy weather." if stormy
      fail "#{rejection} No planes in the hangar." if hangar_empty?
    end
  end

  def hangar_full?
    @planes_in_hangar.length >= capacity
  end

  def hangar_empty?
    @planes_in_hangar.empty?
  end

  def stormy
    weather.is_stormy
  end

  def its_a_plane(object)
    object.instance_of? Plane
  end

  def chocs_away
    plane = @planes_in_hangar.shift
    plane
  end

  def put_in_hangar(plane)
    @planes_in_hangar << plane
    plane.move_to_hangar(name)
  end

  def return_flight_nos
    @planes_in_hangar.map { |plane| "Flight #{plane.flight_number}" }
  end

end
