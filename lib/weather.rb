
class Weather
  attr_reader :random_number, :stormy, :weather_hash

  def initialize
    @random_number = rand(2)
    @random_number == 0 ? @stormy = false : @stormy = true
  end




end
