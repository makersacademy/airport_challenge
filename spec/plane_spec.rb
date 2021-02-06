require 'plane'

describe Plane do
let(:heathrow_airport) { Airport.new }

  describe '#land' do
    it 'should take one argument' do
      expect(subject).to respond_to(:land).with(1)
    end
    it 'should add the plane the airport hangar specified' do
      plane_1 = Plane.new
      plane_1.land(heathrow_airport)
      expect(heathrow_airport.hangar).to include(plane_1)
    end
  end

  describe "#take_off" do
    # let(:plane_1) { Plane.new }
    # let(:plane_2) { instance_double(Plane) }
    # let(:airport) { Airport.new }

    context 'when the plane is in the airport hangar' do
      it 'should remove the plane from the hangar' do
        plane_1 = Plane.new
        airport = Airport.new @hangar=[plane_1]
        # airport.hangar << plane_1
        plane_1.take_off(airport)
        expect(airport.hangar).to be_empty
      end
      it 'should output a take-off success message' do
        plane_1 = Plane.new
        airport = Airport.new @hangar=[plane_1]
        expect { plane_1.take_off(airport) }.to output.to_stdout
      end
    end
  end
end
