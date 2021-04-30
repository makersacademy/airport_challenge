require 'airport.rb'
describe Airport do
  it 'will respond to the method ' do
    expect(subject).to respond_to :land_plane    
  end
  
  describe '#docks_plane' do
    it 'docks a plane' do
      plane = Plane.new
      expect(subject.land_plane(plane)).to eq([plane])
    end
  end

  describe '#docks_plane' do
    it 'raises an error if airport is full' do
      subject.capacity.times { subject.land_plane Plane.new }
      expect { subject.land_plane Plane.new }.to raise_error('Airport is full!')
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
      plane = Plane.new
      subject.land_plane(plane)
      subject.take_off(plane)
      expect(@airports.to_a).to match_array([])
    end
  end
  
end

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport
