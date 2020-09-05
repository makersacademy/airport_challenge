require 'airport'

class PlaneDouble
end

describe Airport do

  subject(:airport) { Airport.new }
  let(:plane) { PlaneDouble.new }
  let(:sunny_weather ) { allow_any_instance_of(Airport).to receive(:rand).and_return(0) }
  let(:stormy_weather) { allow(subject).to receive(:rand).and_return(9) }

  # EXPECTED ERROR MESSAGES
  let(:airport_full) { 'Airport is at capacity' }
  let(:plane_not_here) { 'Plane is not at this airport' }
  let(:stormy_error) { 'Weather is stormy and too unsafe' }

  describe '#clear_landing(plane)' do

    before do
      sunny_weather
    end

    it { should respond_to(:clear_landing).with(1).argument }

    context 'airport has capacity' do
      it 'stores the plane' do
        subject.clear_landing(plane)
        expect(subject.has_plane?(plane)).to eq true
      end

      context 'weather is stormy' do
        before do
          stormy_weather
        end

        it 'raises an error and retains plane at airport' do
          expect { subject.clear_landing(plane) }.to raise_error(stormy_error)
        end
      end
    end

    context 'airport is full' do
      it "raises error and doesn't store plane" do
        Airport::DEFAULT_CAPACITY.times { subject.clear_landing(PlaneDouble.new) }

        expect { subject.clear_landing(plane) }.to raise_error(airport_full)
        expect(subject.has_plane?(plane)).to eq false
      end

      context 'capacity lower than the default is set' do
        it 'limits planes to the lower capacity' do
          low_capacity = Airport::DEFAULT_CAPACITY / 5
          small_airport = Airport.new(low_capacity)

          # fill airport to capacity
          low_capacity.times { small_airport.clear_landing(plane) }

          # request to land one more plane
          expect { small_airport.clear_landing(plane) }.to raise_error(airport_full)
        end
      end

      context 'capacity higher than the default is set' do
        it 'limits planes at the higher capacity' do
          high_capacity = Airport::DEFAULT_CAPACITY * 2
          large_airport = Airport.new(high_capacity)

          # fill airport to capacity
          high_capacity.times { large_airport.clear_landing(plane) }

          # request to land one more plane
          expect { large_airport.clear_landing(plane) }.to raise_error(airport_full)
        end
      end
    end
  end

  describe '#clear_takeoff(plane)' do
    it { should respond_to(:clear_takeoff).with(1).argument }

    context 'plane is at the airport' do
      before do
        sunny_weather
        subject.clear_landing(plane)
      end

      it 'removes the departed plane' do
        subject.clear_takeoff(plane)
        expect(subject.has_plane?(plane)).to eq false
      end

      context 'weather is stormy' do
        before do
          allow(subject).to receive(:rand).and_return(9)
        end

        it "raises an error and retains plane at airport" do
          expect { subject.clear_takeoff(plane) }.to raise_error(stormy_error)
          expect(subject.has_plane?(plane)).to eq true
        end
      end
    end

    context 'plane is not at the airport' do
      it 'raises an error' do
        expect { subject.clear_takeoff(plane) }.to raise_error(plane_not_here)
      end
    end
  end
end
