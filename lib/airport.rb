class Airport
  attr_reader :hangar

  def initialize(capacity = 5)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    full?
    check_weather(set_weather, "land")
    @hangar.push(plane)
  end

  def take_off(plane)
    check_weather(set_weather, "take_off")
    @hangar.delete(plane)
  end

  def view_hangar
    @hangar
  end

  def set_weather
    gw = [1, 2, 3, 4, 5, 6, 7].sample
    return "stormy" if gw > 5

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

end
