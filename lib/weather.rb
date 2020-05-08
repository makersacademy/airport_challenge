class Weather
  attr_reader :storm
  def initialize
    @storm = 1
  end
  def forecast
    @storm = rand(1..10)
    @storm
  end
end
