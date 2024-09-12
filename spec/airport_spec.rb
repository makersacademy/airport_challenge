require 'airport.rb'
require 'plane.rb'
require_relative 'plane_spec.rb'


describe Airport do 

  let(:airport) {Airport.new}
  let(:plane)   {Plane.new}


  # capacity is at 1 originally 
  it 'knows what the capacity of the airport is' do 
    expect(airport.capacity).to eq Airport::MAX_CAPACITY
  end

# the land method allows planes to land - increasing @planes
describe '#land' do  
it 'allows planes to land' do 
    expect(airport.planes).to eq(airport.land(plane))
  end

  # @planes adds up landed planes
  it 'keeps a track of how many planes are at the aiport' do
    airport.land(plane)
    expect(airport.landed_planes).to eq(airport.landed_planes)
  end

  # it should error if a landed plane tries to land
   it 'does not allow planes to land when the airport is full' do
     expect { airport.land }.to raise_error 'Airport capacity reached MAX_CAPACITY' if @planes = airport.airport_full
   end

   it 'stops a plane flying when it has landed' do 
    plane = Plane.new
    plane.fly = false
    expect{ airport.land(plane) }.to raise_error 'Plane not flying.'
   end
  end

  # allows planes to take off and remove 1 from @planes
  describe '#take_off' do
  it 'allows planes to take off' do 
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.take_off(plane)).to eq @planes
  end
  end
end
