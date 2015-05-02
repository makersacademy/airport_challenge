require 'weather'

class WeatherWrapper; include Weather; end

describe WeatherWrapper do

  it { is_expected.to respond_to :stormy? }

end
