require 'airport'
describe Airport do
  before(:each) do
    @airport = Airport.new
  end
  it "lands a plane" do
    plane = Plane.new
    expect(@airport.land(plane).length).to eq 1
  end
  describe '#land' do
    it 'raises an error when full' do
      Airport::DEFAULT_CAPACITY.times do
        @airport.land Plane.new
      end
      expect { @airport.land Plane.new }.to raise_error 'Airport full'
    end
  end
  it 'has a default capacity' do
    expect(@airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  describe 'initialization' do
    it 'has a variable capacity' do
      test_airport = Airport.new(50)
      50.times { test_airport.land Plane.new }
      expect { test_airport.land Plane.new }.to raise_error 'Airport full'
    end
  end
  it "doesn't take off planes that aren't in the airport" do
    plane = Plane.new
    expect { @airport.take_off(plane) }.to raise_error 'Plane not in current airport'
  end
  it "removes planes that take off" do
    plane = Plane.new
    @airport.land(plane)
    @airport.take_off(plane)
    expect(@airport.land(plane).length).to eq 1
  end
  it "doesn't allow planes that already landed to land" do
    plane = Plane.new
    @airport.land(plane)
    expect { @airport.land(plane) }.to raise_error 'Already in airport'
  end
end
