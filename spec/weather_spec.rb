require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it 'has a default chance of storm' do
    expect(weather.chance_of_storm).to eq Weather::CHANCE_OF_STORM
  end

end
