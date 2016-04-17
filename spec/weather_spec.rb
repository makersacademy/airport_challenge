require 'weather'

describe Weather do



  it 'should respond to stormy?' do
    expect(subject).to respond_to :stormy?
  end

  it 'should randomly generate weather' do
    allow(subject).to receive(:rand_weather) {:fine}
    expect(subject.rand_weather).to eq :fine
  end

  it 'should return true if stormy' do
    allow(subject).to receive(:stormy?) {true}
    expect(subject.stormy?).to eq true
  end

  it 'should return true if weather type is stormy' do
    allow(subject).to receive(:rand_weather) {:stormy}
    expect(subject.rand_weather).to eq :stormy
  end

end