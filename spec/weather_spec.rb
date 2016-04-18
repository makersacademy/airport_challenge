require 'weather'

describe Weather do

  it 'responds to stormy?' do
    expect(subject).to respond_to :stormy?
  end

  it 'randomly generates weather' do
    allow(subject).to receive(:rand_weather) {:fine}
    expect(subject.rand_weather).to be :fine
  end

  it 'returns true if stormy' do
    allow(subject).to receive(:stormy?) {true}
    expect(subject.stormy?).to be true
  end

  it 'returns true if weather type is stormy' do
    allow(subject).to receive(:rand_weather) {:stormy}
    expect(subject.rand_weather).to be :stormy
  end

end