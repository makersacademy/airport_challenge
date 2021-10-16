WEATHER_STATES = { stormy: true, not_stormy: false }.freeze
STORMY_ODDS = [WEATHER_STATES[:not_stormy], WEATHER_STATES[:not_stormy],
               WEATHER_STATES[:not_stormy], WEATHER_STATES[:stormy]].freeze

class Weather
  attr_reader :state

  def update_state(state)
    @state = state
  end
end
