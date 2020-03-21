require 'weather'

describe Weather do
  it 'allows you to ask what the weather is like at the moment' do
    expect(subject).to respond_to(:current_weather)  
  end

  it 'tells you when it is stormy' do
    allow(subject).to receive(:current_weather).and_return(:stormy)
    expect(subject.current_weather).to eq(:stormy)
  end
end
