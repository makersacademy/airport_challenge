class Airport
  attr_reader :hangar

  # add tests 2 only let airplanes in hangars
  # doubels
  

  def initialize(capacity = 5)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    full?
    already_landed?(plane)
    check_weather(set_weather, "land")
    @hangar.push(plane)
  end

  def take_off(plane)
    already_left?(plane)
    check_weather(set_weather, "take_off")
    @hangar.delete(plane)
  end

  def view_hangar
    @hangar
  end

  def set_weather
    num = rand(100)
    return "stormy" if num > 90

    "sunny"
  end 

  def check_weather(weather, mode)
    return unless weather == "stormy"

    fail 'Cant land, bad weather!' if mode == "land"
    fail 'Cant take off, bad weather!' if mode == "take_off"
  end

  def full?
    return unless @hangar.count >= @capacity

    raise 'Airport is full' 
  end

  def already_landed?(plane)
    return unless @hangar.include?(plane)

    raise 'This plane has already landed!'
  end

  def already_left?(plane)
    return unless @hangar.count(plane).zero?

    raise 'This plane is unavailable!'
  end

end
