require 'airport'

class PlaneDouble
end

describe Airport do

  subject(:airport) { Airport.new }
  let(:plane) { PlaneDouble.new }

  # EXPECTED ERROR MESSAGES
  let(:airport_full) { 'Airport is at capacity' }
  let(:plane_not_here) { 'Plane is not at this airport' }
  let(:stormy_weather) { 'Weather is stormy and too unsafe' }

  describe '#clear_landing(plane)' do

    it { should respond_to(:clear_landing).with(1).argument }

    context 'when airport has capacity' do
      it 'stores the plane' do
        subject.clear_landing(plane)

        expect(subject.has_plane?(plane)).to eq true
      end
    end

    context 'airport is full' do
      it "raises error and doesn't store plane" do
        Airport::DEFAULT_CAPACITY.times { subject.clear_landing(PlaneDouble.new) }

        expect { subject.clear_landing(plane) }.to raise_error(airport_full)
        expect(subject.has_plane?(plane)).to eq false
      end

      context 'capacity lower than the default is set' do
        it 'limit planes to the lower capacity' do
          low_capacity = Airport::DEFAULT_CAPACITY / 5
          small_airport = Airport.new(low_capacity)
          low_capacity.times { small_airport.clear_landing(plane) }

          expect { small_airport.clear_landing(plane) }.to raise_error(airport_full)
        end
      end

      context 'capacity higher than the default is set' do
        it 'limit planes at the higher capacity' do
          high_capacity = Airport::DEFAULT_CAPACITY * 2
          big_airport = Airport.new(high_capacity)
          high_capacity.times { big_airport.clear_landing(plane) }

          expect { big_airport.clear_landing(plane) }.to raise_error(airport_full)
        end
      end
    end
  end

  describe '#clear_takeoff(plane)' do
    it { should respond_to(:clear_takeoff).with(1).argument }

    context 'plane is at the airport' do
      before do
        # land plane at airport
        subject.clear_landing(plane)
      end

      context 'weather is sunny' do
        before do
          allow(subject).to receive(:rand).and_return(1)
        end

        it 'removes the departed plane' do
          subject.clear_takeoff(plane)

          expect(subject.has_plane?(plane)).to eq false
        end
      end

      context 'weather is stormy' do
        before do
          allow(subject).to receive(:rand).and_return(9)
        end

        it "raises an error and retains plane at airport" do
          expect { subject.clear_takeoff(plane) }.to raise_error(stormy_weather)
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
