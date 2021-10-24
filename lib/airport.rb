class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :weather

  def initialize(arg_cap = nil)
    @hangar = []
    @weather = :unknown
    update_capacity(arg_cap)
  end

  #---------------------------------
  # Editing instance variables
  #---------------------------------

  def add_to_hangar(plane)
    @hangar << plane
  end

  def check_weather(weather_report = WeatherReport.new)
    @weather = weather_report.weather
  end

  def update_capacity(arg_cap = nil)
    fail fail_message_cap if invalid_cap?(arg_cap) # arg_cap must be nil or a number
    fail fail_message_capsm if cap_too_small?(arg_cap)
    @capacity = arg_cap ? arg_cap.to_i : DEFAULT_CAPACITY
  end

  #---------------------------------
  # Launching planes
  #---------------------------------

  def request_launch(plane)
    fail fail_message_rnp if plane.class != Plane
    return false unless weather_is_clear(true) && plane_is_in_hangar(plane)
    launch(plane)
  end

  def launch(plane)
    launch_plane = @hangar.delete(plane)
    plane.update_airport
    plane
  end

  def weather_is_clear(launching)
    return true if check_weather != :stormy
    puts "Cannot #{launching ? "take off" : "land"}: stormy weather"
    false
  end

  def plane_is_in_hangar(plane)
    return true if @hangar.include?(plane)
    puts "Cannot take off: plane is not in this airport"
    false
  end

  #---------------------------------
  # Landing planes
  #---------------------------------

  def request_land(plane)
    fail fail_message_rnp if plane.class != Plane
    return false unless weather_is_clear(false) && space_in_hangar
    land(plane)
  end

  def space_in_hangar
    return true if hangar_count < @capacity
    puts "Cannot land: hangar is full"
    false
  end

  def hangar_count
    @hangar.count
  end

  def land(plane)
    add_to_hangar(plane)
    plane.update_airport(self)
    plane
  end

  private

  def invalid_cap?(v)
    return false if v.nil?
    return true if cant_convert_to_int(v)
    v.to_i.zero?
  end

  def cap_too_small?(v)
    v = DEFAULT_CAPACITY if v.nil?
    v.to_i < @hangar.count
  end

  def cant_convert_to_int(v) !(v.respond_to? :to_i) end

  def fail_message_cap 
    'Capacity must be a numerical value (e.g. 10, 10.0, "10") > 0'
  end

  def fail_message_capsm
    'Cannot set capacity to a lower number than the number of planes already inside'
  end

  def fail_message_rnp
    'Call error: must include a Plane as an argument'
  end
end
