require 'plane'

describe Plane do
  let(:heathrow_airport) { Airport.new }
  let(:small_airport) { Airport.new 1 }
  let(:plane) { Plane.new }
  let(:plane_2) { Plane.new }

  describe '#in_flight?' do
    before :each do
      allow(small_airport).to receive(:weather) { 'sunny' }
      allow(heathrow_airport).to receive(:weather) { 'sunny' }
    end

    context 'when the plane is in-flight' do
      it 'should have an in-flight status of true' do
        plane.land(heathrow_airport)
        plane.take_off(heathrow_airport)
        expect(plane.in_flight).to be true
      end
    end
    context 'when the plane is already on the ground' do
      it 'should not have an in-flight status' do
        allow(plane).to receive(:in_flight) { true }
        plane.land(heathrow_airport)
        expect(plane.in_flight).to be false
      end
    end
  end

  describe '#land' do
    before :each do
      allow(plane).to receive(:in_flight) { true }
    end
    context 'when the weather is `stormy`' do
      it 'should prevent the plane to land' do
        allow(heathrow_airport).to receive(:weather) { 'stormy' }
        expect { plane.land(heathrow_airport) }.to raise_error("Warning! Stormy weather")
      end
    end

    context 'when the weather is `sunny`' do
      before :each do
        allow(small_airport).to receive(:weather) { 'sunny' }
        allow(heathrow_airport).to receive(:weather) { 'sunny' }
      end
      context 'and the airport hangar is full' do
        it 'should prevent plane landing' do
          plane.land(small_airport)
          expect { plane_2.land(small_airport) }.to raise_error("Airport hangar at full capacity")
        end
      end
      context 'and airport hangar is not full' do
        it 'should add the plane the airport hangar specified' do
          plane.land(heathrow_airport)
          expect(heathrow_airport.hangar).to include(plane)
        end
      end
    end
  end

  describe "#take_off" do
    before :each do
      allow(plane).to receive(:in_flight) { false }
    end
    context 'when the weather is `stormy`' do
      it 'should prevent the plane to take_off' do
        allow(heathrow_airport).to receive(:weather) { 'stormy' }
        expect { subject.take_off(heathrow_airport) }.to raise_error("Warning! Stormy weather")
      end
    end

    context 'when the weather is `sunny`' do
      before :each do
        allow(heathrow_airport).to receive(:weather) { 'sunny' }
      end
      context 'and plane is present in the hangar' do
        before do allow(plane).to receive(:is_present?) { false }
        end
        it 'should be removed from the hangar' do
          expect(plane.take_off(heathrow_airport)).to be_nil
        end
      end
      context 'when plane has succesfully left the hangar' do
        it 'should output a take-off success message' do
          heathrow_airport.hangar << plane
          expect { plane.take_off(heathrow_airport) }.to output.to_stdout
        end
      end
    end
  end
end
