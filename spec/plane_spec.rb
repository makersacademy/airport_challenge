require 'plane'

describe Plane do
  let(:airport) do
    double(:airport, stored_planes: [], full?: false, stormy?: false) end
  let(:plane) {described_class.new}

  context 'no storm' do

    let(:weather) {double(:weather, stormy?: false)}

    describe '#airborne?' do

      it 'by default plane is airborne' do
        expect(plane).to be_airborne
      end

    end

    describe '#land' do
      it 'leads to plane being no longer airborne' do
        plane.land(airport)
        expect(plane).not_to be_airborne
      end

      it 'returns plane' do
        expect(plane.land(airport)).to eq plane
      end

      it 'stores plane in airport' do
        plane.land(airport)
        expect(airport.stored_planes).to eq [plane]
      end

      it 'is prevented when the airport is full' do
        allow(airport).to receive(:full?).and_return true
        expect{plane.land(airport)}.to raise_error 'Airport full'
      end

      it 'is prevented when plane has already landed' do
        plane.land(airport)
        expect{plane.land(airport)}.to raise_error "Plane is already in an airport"
      end
    end

    describe '#take_off' do
      before(:example) {plane.land(airport)}

      it 'leads to plane being airborne' do
        plane.take_off
        expect(plane).to be_airborne
      end

      it 'leads airport to lose plane' do
        plane.take_off
        expect(airport.stored_planes).to be_empty
      end

      it 'returns plane' do
        expect(plane.take_off).to eq plane
      end

      it 'is prevented when plane already airbone' do
        plane = Plane.new
        expect{plane.take_off}.to raise_error "Plane is already airborne"
      end
    end
  end

  context 'storm' do
    before(:example) do
      plane.land(airport)
      allow(airport).to receive(:stormy?).and_return true
    end


    it 'prevents landing' do
      plane = described_class.new
      expect{plane.land(airport)}.to raise_error 'Stormy weather prevents landing'
    end

    it 'prevents take off' do
      expect{plane.take_off}.to raise_error 'Stormy weather prevents take off'
    end

    it 'causes plane to have stormy weather' do
      expect(plane).to have_weather_stormy
    end

  end


end
