require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  it 'should check the airport has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'should check the airport can have a variable capacity' do
    airport = Airport.new(50)
    airport.clear
    50.times { airport.tell_plane_to_land(Plane.new) }
    expect{ airport.tell_plane_to_land(Plane.new) }.to raise_error 'Airport full'
  end

  describe '#tell_plane_to_land' do

    it 'should land a plane' do
      plane = Plane.new
      airport.clear
      airport.tell_plane_to_land(plane)
      expect(airport.planes.include?(plane)).to eq true
    end

    it 'should raise an error if a plane tries to land when it\'s stormy' do
      plane = Plane.new
      airport.storm
      expect{airport.tell_plane_to_land(plane)}.to raise_error "Plane can't land in a storm"
    end

    it 'should raise an error if the airport is full' do
      airport.clear
      Airport::DEFAULT_CAPACITY.times { airport.tell_plane_to_land(Plane.new) }
      expect { airport.tell_plane_to_land(Plane.new) }.to raise_error 'Airport full'
    end

  end

  describe '#tell_plane_to_take_off' do

    it 'should let a plane take off' do
      plane = Plane.new
      airport.clear
      airport.tell_plane_to_land(plane)
      airport.tell_plane_to_take_off(plane)
      expect(airport.planes.include?(plane)).to eq false
    end

    it 'should raise an error if a plane tries to take off when it\'s stormy' do
      plane = Plane.new
      airport.tell_plane_to_land(plane)
      airport.storm
      expect{airport.tell_plane_to_take_off(plane)}.to raise_error "Plane can't take off in a storm"
    end

  end

end
