class Airport
  attr_reader :airport, :message, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land
    @airport << 'plane'
    @message = 'Plane has landed'
  end

  def prevent_landing
    if full?
      @message = 'Abort landing, airport is full'
    elsif weather == 'stormy'
      @message = 'The weather is not suitable for landing'
    else
      land
    end
  end

  def takeoff
    @airport.pop
    @message = 'Plane has taken off and is no longer at the airport'
  end

  def prevent_takeoff
    if weather == 'stormy'
      @message = 'The weather is not suitable for takeoff'
    else
      takeoff
    end
  end

  def weather
    rand(50) < 25 ? 'sunny' : 'stormy'
  end

  def full?
    @airport.length == @capacity
  end
end
