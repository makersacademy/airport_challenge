require_relative "plane"
require_relative "weather"

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :weather

  def initialize(arg_cap = nil)
    @hangar = []
    @weather = :unknown
    update_capacity(arg_cap)
  end

  def add_to_hangar(plane)
    @hangar << plane
  end

  def update_capacity(arg_cap = nil)
    fail fail_message_cap if invalid_cap?(arg_cap) # arg_cap must be nil or a number
    @capacity = arg_cap ? arg_cap.to_i : DEFAULT_CAPACITY
  end

  def check_weather(weather_report = WeatherReport.new)
    @weather = weather_report.weather
  end

  def request_launch(plane)
    fail fail_message_rnp if plane.class != Plane
  end

  def weather_is_clear
    return true if check_weather != :stormy
    puts "Cannot take off: stormy weather"
    false
  end

  def plane_is_in_hangar(plane)
    return true if @hangar.include?(plane)
    puts "Cannot take off: plane is not in this airport"
    false
  end

  private

  def invalid_cap?(v)
    return false if v.nil?
    return true if cant_convert_to_int(v)
    v.to_i.zero?
  end

  def cant_convert_to_int(v) !(v.respond_to? :to_i) end

  def fail_message_cap 
    'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
  end

  def fail_message_rnp
    'Call error: must include a Plane as an argument'
  end
end
