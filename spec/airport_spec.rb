require 'airport'

describe Airport do
subject(:airport) {described_class.new}
let(:plane) {double :plane}

describe '#initialize' do
  it 'a new airport contains an empty array of planes' do
    expect(airport.planes).to be_empty
  end
  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'has a default capacity that can be changed' do
    airport = Airport.new(20) #not sure why airport(20) doesn't work?!
    expect(airport.capacity).to eq 20
  end
end

describe '#full?' do
  it 'is true when capacity exceeded' do
    airport.weather = 'sunny'
    airport.capacity.times {Plane.new.land(airport)}
    expect(airport.full?).to be true
  end
end

end

# not sure why this test doesn't work!
#describe '#full?' do
#  it 'true when capacity exceeded' do
#    allow(plane).to receive(:land).and_return (airport.planes << self)
#    puts airport.capacity.times {plane.land(airport)}
#    airport.capacity.times {plane.land(airport)}
#    expect(airport.full?).to be true
#end
#end
