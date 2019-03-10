class Weather

  attr_accessor :status

  def initialize
    @status = random_weather
  end

  def random_weather
    types = [:sunny, :stormy]
    random_number = rand(1..5)
    case random_number
    when (1..3) then types.first
    when (4..5) then types.last
    end
  end

end
