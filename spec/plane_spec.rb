require 'plane'

describe Plane do

  let(:airport) { instance_double("Airport") }
  let(:plane) { Plane.new }

  describe '#initialize' do

    it 'is initiailised to be flying' do
      expect(plane.flying?).to eq true
    end

    it 'has a location of in-flight' do
      expect(plane.location?).to eq "In-flight"
    end
  end

  describe '#land' do
    context 'when plane is in flight' do

      it 'lands the plane' do
        plane.land(airport)
        expect(plane.flying?).to eq false
      end

      it 'sets location to the controlling airport' do
        subject.land(airport)
        expect(subject.location?).to eq airport
      end

    end

    context 'when the plane is in the airport' do
      before { subject.land(airport) }

      it 'raises an error' do
        expect { subject.land(airport) }.to raise_error(PlaneError, "Plane already on the ground")
      end
    end
  end

  describe '#take_off' do

    context 'when the plane is in the air' do
      it "raises an error" do
        subject.take_off
        expect { subject.take_off }.to raise_error(PlaneError, "Plane already in-flight")
      end
    end

    context 'when the plane is not flying' do
      before { subject.land }

      it "takes off" do
        subject.take_off
        expect(subject.flying?).to eq true
      end

      it 'tells airport that it has taken off' do
        expect(airport).to receive(:release_plane).with(subject)
        subject.take_off
      end
    end


  end



  describe '#flying?' do
    context 'when the plane has not taken off' do
      it 'returns false' do
        expect(subject.flying?).to eq false
      end
    end

    context 'when a plane is flying' do
      before do
        subject.set_departure_airport(airport)
        subject.take_off
      end
      it 'returns true' do
        expect(subject.flying?).to eq true
      end
    end
  end

end
