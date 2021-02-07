require 'airport'
describe Airport do
  it "lands a plane" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane).length).to eq 1
  end
  describe '#land' do
    it 'raises an error when full' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land Plane.new
      end
      expect { subject.land Plane.new }.to raise_error 'Airport full'
    end
  end
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(50)
      50.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error 'Airport full'
    end
  end
  it "doesn't take off planes that aren't in the airport" do
    plane = Plane.new
    airport = Airport.new
    expect { airport.take_off(plane) }.to raise_error 'Plane not in current airport'
  end
  it "removes planes that take off" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.land(plane).length).to eq 1
  end
end
