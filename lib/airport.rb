class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    planes.push(plane)
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
