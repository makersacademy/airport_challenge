require 'error'

describe WeatherError do
  it { is_expected.to be_a(WeatherError) }
end

describe PlaneError do
  it { is_expected.to be_a(PlaneError) }
end

describe AirportError do
  it { is_expected.to be_a(AirportError) }
end
