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
        plane.land(airport)
        expect(plane.location?).to eq airport
      end

    end

    context 'when the plane is in the airport' do
      before { plane.land(airport) }

      it 'raises an error' do
        expect { plane.land(airport) }.to raise_error(PlaneError, "Plane already on the ground")
      end
    end
  end

  describe '#take_off' do

    context 'when the plane is in the air' do
      it "raises an error" do
        expect { plane.take_off }.to raise_error(PlaneError, "Plane already in-flight")
      end
    end

    context 'when the plane is not flying' do
      before { plane.land(airport) }

      it "takes off" do
        plane.take_off
        expect(plane.flying?).to eq true
      end

      it 'sets location to In-flight' do
        plane.take_off
        expect(plane.location?).to eq "In-flight"
      end
    end
  end

end
