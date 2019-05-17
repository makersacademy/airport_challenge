class Plane
  attr_accessor :flying

  def initialize
    @flying = true
  end

  def weather_number
    rand(1..6)
  end
end
