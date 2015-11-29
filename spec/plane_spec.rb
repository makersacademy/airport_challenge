require 'plane'

describe Plane do
  let(:airport) {double(:airport, full?: false, stored_planes: [], stormy?: false)}
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
        allow(airport).to receive(:full?){true}
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

    it 'prevents landing' do
      allow(airport).to receive(:stormy?){true}
      expect{plane.land(airport)}.to raise_error 'Stormy weather prevents landing'
    end

    it 'prevents take_off' do
      plane.land(airport)
      allow(airport).to receive(:stormy?){true}
      expect{plane.take_off}.to raise_error 'Stormy weather prevents take off'
    end

  end


end
