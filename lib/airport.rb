class Airport
  attr_accessor :airplanes_landed

  def initialize(forecast)
    @forecast = forecast
    @airplanes_landed = []
  end

  DEFAULT_CAPACITY = 10

  def land(airplane)
    return if @forecast == true
    return "Airport full." if full?
    @airplanes_landed << airplane
    "The plane has landed."
  end

  def take_off
    return if @forecast == true || @airplanes_landed.empty?
    @airplanes_landed.pop
    "The plane has taken off."
  end

  private

  def full?
    true if @airplanes_landed.size >= DEFAULT_CAPACITY
  end

end
