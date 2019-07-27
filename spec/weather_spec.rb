require 'weather'

describe Weather do

  # Responds to stormy
  it { respond_to(:stormy?) }

  # Provides boolean values

  it 'returns true or false from .stormy?' do
    expect(subject.stormy?).to eq(true).or eq(false)
  end

  it 'throws error if incorrect prob value given.' do
    expect { Weather.new(1.1) }.to raise_error Weather::ERR_STORM_PROB
    expect { Weather.new(-0.1) }.to raise_error Weather::ERR_STORM_PROB
  end

  it 'Is never stormy with storm prob = 0' do
    calm_weather = Weather.new(0)
    100.times do
      expect(calm_weather.stormy?).to eq(false)
    end
  end

  it 'Is always stormy with storm prob = 1' do
    stormy_weather = Weather.new(1)
    100.times do
      expect(stormy_weather.stormy?).to eq(true)
    end
  end

end
