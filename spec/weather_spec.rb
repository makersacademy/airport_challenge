require 'weather'

describe Weather do

  it 'creates stormy weather' do
    allow(Kernel).to receive(:rand).and_return(2)
    expect(Weather.new.stormy?).to eq(:stormy)
  end
  
end
