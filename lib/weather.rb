class Weather

  attr_accessor :status

  def initialize
    @status = random_weather
  end

  def random_weather
    types = [:sunny, :stormy]
    random_number = rand(1..10)
    case random_number
    when (1..6) then types.first
    when (7..10) then types.last
    end
  end

end
