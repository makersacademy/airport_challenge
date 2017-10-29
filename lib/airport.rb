class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def dock(plane)
    @planes << plane
  end

  def confirm_take_off(plane)
    @planes.delete(plane)
  end

  def weather_conditions
    number = rand(3)
    return :stormy if number == 2
    :sunny
  end
end
