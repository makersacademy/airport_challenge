
class Weather
  attr_reader :weather
  def initialize
    @weather = [:storm,:no_storm,:no_storm,:no_storm].sample
  end
end
