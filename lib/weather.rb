WEATHER_STATES = { stormy: true, not_stormy: false }.freeze
STORMY_ODDS = [WEATHER_STATES[:not_stormy], WEATHER_STATES[:not_stormy], 
WEATHER_STATES[:not_stormy], WEATHER_STATES[:stormy]].freeze

class Weather
  def initialize
    @state = WEATHER_STATES[:not_stormy]
  end

  attr_reader :state
end
