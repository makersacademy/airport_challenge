class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather = 'clear')
    case weather
    when 'stormy'
      return "Unable to land; stormy weather."
    else
      if planes.length < capacity
        planes.push(plane)
      else
        "Unable to land; airport full."
      end
    end
  end

  def take_off(plane, weather = 'clear')
    case weather
    when 'stormy'
      return "Planes grounded; stormy weather."
    else
      planes.delete(plane)
    end
  end
end
