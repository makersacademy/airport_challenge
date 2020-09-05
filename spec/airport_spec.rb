require 'airport'

class PlaneDouble

end

describe Airport do

  let(:subject) { Airport.new }
  let(:plane) { PlaneDouble.new }

  describe '#clear_landing(plane)' do

    context "when airport has capacity" do
      it { should respond_to(:clear_landing).with(1).argument }

      it 'stores the plane that landed' do
        subject.clear_landing(plane)
        expect(subject.has_plane?(plane)).to eq true
      end
    end

    context "when airport is full" do
      # let(:small_airport) { small_airport = Airport.new(3); small_airport.clear_landing(plane) }
      # 3.times { small_airport.clear_landing(plane) }

      it 'raises an error on landing request' do
        small_airport = Airport.new(3)
        3.times { small_airport.clear_landing(plane) }
        expect { small_airport.clear_landing(plane) }.to raise_error("Airport is at capacity")
      end

      it 'does not land planes' do

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
