class Airport
  attr_accessor :hangar
  attr_reader   :capacity
  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @local_weather = Weather.new
    @capacity = capacity
  end

  def call_weather
    @local_weather.check_weather
  end

  def landing_control(plane)
    if hangar.length >= capacity
      p 'No space to land'
    else
      local_weather = call_weather
      if local_weather == 'Sunny'
        hangar.push(plane)
        p 'The plane has landed'
      else
        p 'There is a storm - cannot land!'
      end
    end
  end

  def take_off(plane)
    if hangar.length == 0
      p 'There are no planes ready to take-off'
    else
      local_weather = call_weather
      if local_weather == 'Sunny'
        hangar.pop
        p 'The plane has taken off'
      else
        p 'There is a storm - cannot take-off!'
      end
    end
  end

end
