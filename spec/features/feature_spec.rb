require 'airport'
require 'plane'
require 'weather'

describe 'challenge bonus feature tests' do

  let(:airport) {Airport.new(Weather)}
  let(:airport2) {Airport.new(Weather, 5)}
  let(:plane) {Plane.new}
  let(:plane2) {Plane.new}
  let(:plane3) {Plane.new}
  let(:plane4) {Plane.new}
  let(:plane5) {Plane.new}
  let(:plane6) {Plane.new}
  let(:weather) {Weather.new}

  before do
    allow(airport).to receive(:stormy?).and_return false
    allow(airport2).to receive(:stormy?).and_return false
  end

  describe 'landing' do
    it 'planes can land at an airport and are contained within it' do
      airport.land(plane)
      airport.land(plane2)
      airport.land(plane3)
      airport.land(plane4)
      airport.land(plane5)
      airport.land(plane6)
      planes_array = [plane, plane2, plane3, plane4, plane5, plane6]
      expect(airport.planes_landed).to eq planes_array
    end

    it 'planes cannot land when in an airport' do
      airport.land(plane)
      message = "The plane has already landed"
      expect{ airport.land(plane)}.to raise_error message
    end
  end


  describe 'take off' do

    before do
      airport.land(plane)
      airport.land(plane2)
      airport.land(plane3)
      airport.land(plane4)
      airport.land(plane5)
      airport.land(plane6)
    end

    it 'planes can take off from airport' do
      airport.take_off(plane)
      airport.take_off(plane2)
      airport.take_off(plane3)
      airport.take_off(plane4)
      airport.take_off(plane5)
      airport.take_off(plane6)
      expect(airport.planes_landed).to eq []
    end

    it 'planes can not take off when in the air' do
      airport.take_off(plane)
      message = "The plane is already in the air"
      expect{ airport.take_off(plane)}.to raise_error message
    end

    it 'planes can not land in stormy weather' do
      allow(airport2).to receive(:stormy?).and_return true
      message = "Cannot land in stormy conditions"
      expect{airport2.land(plane)}.to raise_error message
    end

  end

  describe 'planes landing at another airport' do

    before do
        airport2.land(plane)
        airport2.land(plane2)
        airport2.land(plane3)
        airport2.land(plane4)
        airport2.land(plane5)
    end

      it 'planes can land at another airport' do
        planes_array = [plane, plane2, plane3, plane4, plane5]
        expect(airport2.planes_landed).to eq planes_array
      end

      it 'planes can not land at a full airport' do
        message =  "Airport Full"
        expect{airport2.land(plane6)}.to raise_error message
      end

  end

end
