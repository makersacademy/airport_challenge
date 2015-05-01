require 'weather_container'

class Weather; include WeatherContainer; end

describe Weather do

  it { is_expected.to respond_to :stormy? }

end