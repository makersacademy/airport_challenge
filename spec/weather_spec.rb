require 'weather'

describe Weather do
  it 'should respond to #current_state' do
    expect(subject).to respond_to(:current_state)
  end
  it 'should return either "good" or "stormy" when #current_state is called on it' do
    expect([:good, :stormy].include?(subject.current_state)).to eq true
  end
  it 'should respond to #safe?' do
    expect(subject).to respond_to(:safe?)
  end
  it 'should return true if weather is good and #safe is called on it' do
    weather = subject
    allow(weather).to receive(:current_state){:good}
    expect(weather.safe?).to eq true
  end
  it 'should return false if weather is bad and #safe is called on it' do
    weather = subject
    allow(weather).to receive(:current_state){:stormy}
    expect(weather.safe?).to eq false
  end
  it 'should respond to #random_weather' do
    expect(subject).to respond_to(:random_weather)
  end
  it 'should either return :stormy or :good when #random_weather is called on it' do
    expect([:good, :stormy].include?(subject.random_weather)).to eq true
  end
end
