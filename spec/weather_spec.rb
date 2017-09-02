require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it 'can be stormy' do
    expect(weather).to be_stormy
  end

  it 'has a default chance of stormy-ness' do
    expect(weather.forecast).to eq Weather::FORECAST_STORM
  end

end
