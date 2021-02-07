require 'plane'

describe Plane do
let(:heathrow_airport) { Airport.new }

  describe '#land' do
      it 'should take one argument' do
        expect(subject).to respond_to(:land).with(1)
      end

    context 'when airport#weather is `stormy`' do
      it 'should prevent the plane to land' do
        allow(heathrow_airport).to receive(:weather) { 'stormy' }
        expect { subject.land(heathrow_airport) }.to raise_error("Warning! Stormy weather")
      end
    end

    context 'when the weather is `sunny` and the airport hangar is full' do
      it 'should prevent plane landing' do
        small_airport = Airport.new @capacity=1
        plane_1 = Plane.new
        plane_2 = Plane.new
        plane_1.land(small_airport)
        allow(small_airport).to receive(:weather) { 'sunny' }
        expect { plane_2.land(small_airport) }.to raise_error("Airport hangar at full capacity")
      end
    end

    context 'when the weather is `sunny` and airport hangar has available spaces' do
      it 'should add the plane the airport hangar specified' do
        plane_1 = Plane.new
        plane_1.land(heathrow_airport)
        allow(heathrow_airport).to receive(:weather) { 'sunny' }
        expect(heathrow_airport.hangar).to include(plane_1)
      end
    end
  end

  describe "#take_off" do

    context 'when the plane is in the airport hangar' do
      it 'should remove the plane from the hangar' do
        plane_1 = Plane.new
        airport = Airport.new @hangar=[plane_1]
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
