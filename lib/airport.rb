class Airport
  attr_reader :capacity, :planes

  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
    @status = :open
  end

  def close
    @status = :closed
  end

  def open
    @status = :open
  end

  def receive(plane)
    @planes.push(plane)
    return unless @planes.length >= @capacity
    
    @status = :closed
  end

  def status
    weather == "stormy" ? :closed : @status
  end

  def weather
    forecast = rand(1..20)
    case forecast
    when 1..19
      "sunny"
    when 20
      "stormy"
    end
  end
end
