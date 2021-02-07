class Airport
  attr_reader :capacity, :planes, :state

  def initialize(capacity = 50)
    @capacity = capacity
    @planes = []
    @state = :open
  end

  def close
    @state = :closed
  end

  def open
    @state = :open
  end

  def receive(plane)
    @planes.push(plane)
    return unless @planes.length >= @capacity

    @state = :closed
  end

  # def release(plane)
  # end

  def status
    weather == "stormy" ? :closed : @state
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
