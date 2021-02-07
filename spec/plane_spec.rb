require 'plane'

describe Plane do
  let(:heathrow_airport) { Airport.new }
  let(:small_airport) { Airport.new 1 }
  let(:plane) { Plane.new }

  describe '#land' do
    it 'should take one argument' do
      expect(plane).to respond_to(:land).with(1)
    end

    # context 'when the plane is already landed'do
    #   it 'should not land again' do
    #     plane_1 = Plane.new
    #     airport_1 = Airport.new
    #     airport_2 = Airport.new
    #     plane_1.land(airport_1)
    #     expect { plane_1.land(airport_2) }.to raise_error("Plane has already landed")
    #   end
    # end

    context 'when airport#weather is `stormy`' do
      it 'should prevent the plane to land' do
        allow(heathrow_airport).to receive(:weather) { 'stormy' }
        expect { plane.land(heathrow_airport) }.to raise_error("Warning! Stormy weather")
      end
    end

    context 'when the weather is `sunny` and the airport hangar is full' do
      it 'should prevent plane landing' do
        small_airport = Airport.new @capacity = 1
        plane_1 = Plane.new
        plane_2 = Plane.new
        allow(small_airport).to receive(:weather) { 'sunny' }
        plane_1.land(small_airport)
        expect { plane_2.land(small_airport) }.to raise_error("Airport hangar at full capacity")
      end
    end

    context 'when the weather is `sunny` and airport hangar has available spaces' do
      it 'should add the plane the airport hangar specified' do
        plane_1 = Plane.new
        allow(heathrow_airport).to receive(:weather) { 'sunny' }
        plane_1.land(heathrow_airport)
        expect(heathrow_airport.hangar).to include(plane_1)
      end
    end

  end

  describe "#take_off" do

    context 'when the weather is `stormy`' do
      it 'should prevent the plane to take_off' do
        allow(heathrow_airport).to receive(:weather) { 'stormy' }
        expect { subject.take_off(heathrow_airport) }.to raise_error("Warning! Stormy weather")
      end
    end

    context 'when it is `sunny` and plane is present in the hangar' do
      it 'should be removed from the hangar' do
        plane_1 = Plane.new
        airport = Airport.new @hangar = []
        allow(airport).to receive(:weather) { 'sunny' }
        allow(plane_1).to receive(:is_present?) { false }
        expect(plane_1.take_off(airport)).to be_nil
      end
    end

    context 'when plane has succesfully left the hangar' do
      it 'should output a take-off success message' do
        plane_1 = Plane.new
        airport = Airport.new @hangar = []
        airport.hangar << plane_1
        allow(airport).to receive(:weather) { 'sunny' }
        # allow(airport).to receive(:hangar) { plane_1 }
        expect { plane_1.take_off(airport) }.to output.to_stdout
      end
    end

  end
end

# Edge cases:
# planes can only take off from airports they are in;
# planes that are already flying cannot take off and/or be in an airport;
# planes that are landed cannot land again and must be in an airport
