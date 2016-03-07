require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it 'reports true if inclement' do
    allow(weather).to receive(:random_weather).and_return(:inclement)
    expect(weather.inclement?).to eq true
  end

  it 'reports false if clear' do
    allow(weather).to receive(:random_weather).and_return(:clear)
    expect(weather.inclement?).to eq false
  end
end
