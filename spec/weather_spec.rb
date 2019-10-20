require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  it 'can be stormy' do
    allow(weather).to receive(:random_outlook).and_return :stormy
    result = weather.stormy?
    expect(result).to eq true
  end

  it 'can be sunny' do
    allow(weather).to receive(:random_outlook).and_return :sunny
    result = weather.stormy?
    expect(result).to eq false
  end
end
