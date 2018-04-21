require 'plane'

describe Plane do

  let(:airport) { instance_double("Airport") }

  describe '#set_departure_airport' do

    it 'sets a departure airport' do
      subject.set_departure_airport(airport)
      expect(subject.departure_airport).to eq airport
    end

  end

  describe '#set_destination_airport' do

    it 'sets a destination airport' do
      subject.set_destination_airport(airport)
      expect(subject.destination_airport).to eq airport
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
        allow(airport).to receive(:release_plane)
        subject.take_off
      end
      it 'returns true' do
        expect(subject.flying?).to eq true
      end
    end
  end

  describe '#take_off' do
    before do
      subject.set_departure_airport(airport)
      allow(airport).to receive(:release_plane)
    end

    context 'when the plane is not flying' do
      it "takes off" do
        subject.take_off
        expect(subject.flying?).to eq true
      end

      it 'tells airport that it has taken off' do
        expect(airport).to receive(:release_plane).with(subject)
        subject.take_off
      end
    end

    context 'when the plane is in the air' do
      it "raises an error" do
        subject.take_off
        expect { subject.take_off }.to raise_error(PlaneError, "Plane already in-flight")
      end
    end
  end

  describe '#land' do
    context 'when plane is in flight' do
      before do
        subject.set_departure_airport(airport)
        allow(airport).to receive(:release_plane)
        subject.take_off
      end
      it 'lands the plane' do
        subject.land
        expect(subject.flying?).to eq false
      end
    end

    context 'when the plane is in the airport' do
      it 'raises an error' do
        expect { subject.land }.to raise_error(PlaneError, "Plane already on the ground")
      end
    end
  end

end
