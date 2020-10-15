require 'plane'
require 'airport'

RSpec.describe Airport do

  describe '#land' do
    it 'instructs a plane to land at the airport' do
      allow_any_instance_of(Airport).to receive(:rand).and_return(5)
      plane = Plane.new
      expect(subject.land(plane)).to eq "Landing!"
    end
    it 'denies landing if the airport is full' do
      allow_any_instance_of(Airport).to receive(:rand).and_return(5)
      subject.capacity.times {
        plane = Plane.new
        subject.land(plane)
      }
      extra_plane = Plane.new
      expect(subject.land(extra_plane)).to eq "Airport full, go away."
    end
    it 'denies landing if the airport is full with different capacity' do
      allow_any_instance_of(Airport).to receive(:rand).and_return(5)
      big_airport = Airport.new(85)
      big_airport.capacity.times {
        plane = Plane.new
        big_airport.land(plane)
      }
      extra_plane = Plane.new
      expect(big_airport.land(extra_plane)).to eq "Airport full, go away."
    end
    it 'allows landing if the airport has capacity with different capacity' do
      allow_any_instance_of(Airport).to receive(:rand).and_return(5)
      big_airport = Airport.new(85)
      (big_airport.capacity - 1).times {
        plane = Plane.new
        big_airport.land(plane)
      }
      extra_plane = Plane.new
      expect(big_airport.land(extra_plane)).to eq "Landing!"
    end
    it 'denies landing if the weather is stormy' do
      allow_any_instance_of(Airport).to receive(:rand).and_return(1)
      plane = Plane.new
      expect(subject.land(plane)).to eq "No landing in stormy weather."
    end

  end

  describe '#takeoff' do
    it 'instructs a plane to takeoff from the airport and confirm it is no longer there' do
      allow_any_instance_of(Airport).to receive(:rand).and_return(4)
      plane = Plane.new
      subject.planes << plane
      expect(subject.takeoff(plane)).to eq "I, #{plane}, have taken off."
    end
    it 'denies takeoff if the plane is not at the airport' do
      allow_any_instance_of(Airport).to receive(:rand).and_return(4)
      plane = Plane.new
      subject.land(plane)
      plane2 = Plane.new
      expect(subject.takeoff(plane2)).to eq "That plane is not here."
    end
    it 'prevents takeoff when weather is stormy' do
      allow_any_instance_of(Airport).to receive(:rand).and_return(1)
      plane = Plane.new
      expect(subject.takeoff(plane)).to eq "No flying in stormy weather."
    end
  end

end
