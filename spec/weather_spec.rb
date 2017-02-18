require 'weather'
require 'airport'

describe Weather do

# attempted stubbing method, not fully convinced
  let(:airport) { Airport.new }
  it 'is stormy?' do
    allow(airport).to receive(:stormy?).and_return(true)
    expect(airport.stormy?).to be true
  end

end
