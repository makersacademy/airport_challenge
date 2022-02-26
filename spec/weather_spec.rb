require 'weather'

describe Weather do
  it 'creates a new Weather object' do
    weather = Weather.new
  end

  it 'creates stormy weather' do
    allow(Kernel).to receive(:rand).and_return(2)
    expect(Weather.new.generate).to eq(:stormy)
  end
end
