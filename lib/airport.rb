require_relative 'plane'
require_relative 'weather'
require_relative 'error'

class Airport
  attr_reader :gates, :weather, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(args = { capacity: DEFAULT_CAPACITY })
    @gates    = []
    @weather  = Weather.new
    @capacity = args.fetch(:capacity)
  end

  def instruct(args)
    raise WeatherError, "Inclement weather" unless check_weather
    action, plane = args.fetch(:action), args.fetch(:plane)

    action == "land" ? land(plane) : take_off(plane)
  end

  def report(action, plane)
    puts case action
         when "land" then "#{plane} has landed successfully."
         when "take off" then "#{plane} has taken off successfully."
         end
  end

  private
  def check_weather
    weather.good?
  end

  def full?
    gates.count >= capacity
  end

  def land(plane)
    raise PlaneError, "Plane not flying" if plane.grounded?
    raise AirportError, "Airport is full" if full?
    gates << plane
    plane.grounded = true
    report("land", plane)
  end

  def take_off(plane)
    raise PlaneError, "Plane already flying" unless plane.grounded?
    leave_gate(plane)
    plane.grounded = false
    report("take off", plane)
  end

  def leave_gate(plane)
    search = Proc.new { |ele| ele == plane }

    raise AirportError, "Plane not found" if gates.select(&search).empty?
    gates.delete_if(&search)
  end
end
