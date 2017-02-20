class Airport
  attr_accessor :airplanes_landed
  def initialize(forecast)
    @forecast = forecast
    @airplanes_landed = []
  end

  def land(airplane)
    storm_check
    @airplanes_landed << airplane unless full
    plane_arrived
  end

  def take_off
    storm_check
    @airplanes_landed.pop unless empty
    plane_left
  end


  private

  DEFAULT_CAPACITY = 10

  def plane_left
    "The plane has taken off."
  end

  def plane_arrived
    "The plane has landed."
  end

  def storm_check
    fail "Storm Alert!" if @forecast == true
  end

  def full
    fail "Airport full!" if @airplanes_landed.size >= DEFAULT_CAPACITY
  end

  def empty
    fail "No planes available." if @airplanes_landed.empty?
  end

end
