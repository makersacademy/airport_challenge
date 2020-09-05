require 'airport'

class PlaneDouble

end

describe Airport do

  let(:subject) { Airport.new }
  let(:plane) { PlaneDouble.new }

  describe '#clear_landing(plane)' do

    context 'when airport has capacity' do
      it { should respond_to(:clear_landing).with(1).argument }

      it 'stores the plane that landed' do
        subject.clear_landing(plane)
        expect(subject.has_plane?(plane)).to eq true
      end
    end

    context 'when airport is full' do

      before(:context) do
        capacity = 3
        @small_airport = Airport.new(capacity)
        capacity.times { @small_airport.clear_landing(PlaneDouble.new) }
      end

      it "raises error and doesn't store plane" do
        full_error = "Airport is at capacity"
        expect { @small_airport.clear_landing(plane) }.to raise_error(full_error)
        expect(@small_airport.has_plane?(plane)).to eq false
      end
    end
  end

  describe '#clear_takeoff(plane)' do
    it { should respond_to(:clear_takeoff).with(1).argument }

    it 'removes the plan that has taken off' do
      subject.clear_landing(plane)
      subject.clear_takeoff(plane)
      expect(subject.has_plane?(plane)).to eq false
    end

    it 'raises an error when plane is not at the airport' do
      expect { subject.clear_takeoff(plane) }.to raise_error("Plane is not at this airport")
    end
  end
end
