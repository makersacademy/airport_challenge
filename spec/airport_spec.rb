require 'plane'
require 'airport'

RSpec.describe Airport do

  describe '#land' do
    context 'weather is good' do
      before(:each) do
        allow_any_instance_of(Weather).to receive(:bad?).and_return(false)
        @plane = Plane.new
      end
      it 'instructs a plane to land at the airport' do
        expect(subject.land(@plane)).to eq "Landing!"
      end
      it 'denies landing if the airport is full' do
        subject.capacity.times {
          extra_plane = Plane.new
          subject.land(extra_plane)
        }
        expect { subject.land(@plane) }.to raise_error("Airport full, go away.")
      end
      it 'denies landing if the airport is full with different capacity' do
        big_airport = Airport.new(Airport::DEFAULT_CAPACITY * 5)
        big_airport.capacity.times {
          extra_plane = Plane.new
          big_airport.land(extra_plane)
        }
        expect { big_airport.land(@plane) }.to raise_error("Airport full, go away.")
      end
      it 'allows landing if the airport has capacity with different capacity' do
        big_airport = Airport.new(Airport::DEFAULT_CAPACITY * 5)
        (big_airport.capacity - 1).times {
          extra_plane = Plane.new
          big_airport.land(extra_plane)
        }
        expect(big_airport.land(@plane)).to eq "Landing!"
      end
    end

    context 'weather is good' do
      before(:each) do
        allow_any_instance_of(Weather).to receive(:bad?).and_return(true)
        @plane = Plane.new
      end
      it 'denies landing if the weather is stormy' do
        expect { subject.land(@plane) }.to raise_error("No landing in stormy weather.")
      end
    end

  end

  describe '#take_off' do
    context 'weather is good' do
      before(:each) do
        allow_any_instance_of(Weather).to receive(:bad?).and_return false
        @plane = Plane.new
        subject.planes << @plane
      end

      it 'instructs a plane to take_off from the airport and confirm it is no longer there' do
        expect(subject.take_off(@plane)).to eq "I, #{@plane}, have taken off."
        expect(subject.planes.include?(@plane)).to eq false
      end
      it 'denies take_off if the plane is not at the airport' do
        plane2 = Plane.new
        expect { subject.take_off(plane2) }.to raise_error("That plane is not here.")
      end
      it 'prevents a plane taking off from a different airport' do
        airport2 = Airport.new
        expect { airport2.take_off(@plane) }.to raise_error("That plane is not here.")
      end
      it 'prevents a plane that is already flying from taking off' do
        subject.take_off(@plane)
        expect { subject.take_off(@plane) }.to raise_error("That plane is not here.")
      end
    end

    context 'weather is stormy' do
      before(:each) do
        allow_any_instance_of(Weather).to receive(:bad?).and_return true
        @plane = Plane.new
        subject.planes << @plane
      end

      it 'prevents take_off when weather is stormy' do
        expect { subject.take_off(@plane) }.to raise_error("No flying in stormy weather.")
      end
    end

  end

end
