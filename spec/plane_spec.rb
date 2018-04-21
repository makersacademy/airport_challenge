require 'plane'

describe Plane do

  let(:airport) { instance_double("Airport") }

  describe '#flying?' do
    context 'when the plane is in an airport' do
        it 'returns false' do
          expect(subject.flying?).to eq false
        end
    end
  end

  describe '#take_off' do

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
      it 'lands the plane' do
        subject.take_off
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
