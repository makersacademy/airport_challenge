require 'airport'

describe Airport do
  
  subject(:airport) {described_class.new(weather: weather)}
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather, bad?: false)}

  describe '<><> Handling takeoff and landing <><>' do
    context '=> if bad weather' do
      before do
        allow(weather).to receive(:bad?) { true }
      end
      it 'should prevent landing if the weather at airport is bad' do
        expect{airport.approve_landing?(plane)}.to raise_error "Bad weather, try again later"
      end
      it 'should prevent take off if the weather is bad' do
        airport.planes << plane
        expect{airport.approve_takeoff?(plane)}.to raise_error "Bad weather, try again later"
      end
    end
  end

  describe '<><> Handling landing <><>' do
    it 'should add the landed plane' do
      airport.planes << plane
      expect(airport.planes.include?(plane)).to eq true
    end
    it 'should prevent landing if the airport is full' do
      airport.max_capacity.times { airport.planes << plane }
      expect{airport.approve_landing?(plane)}.to raise_error "#{airport.name} is full"
    end
  end

  describe '<><> Handling takeoff <><>' do
    it 'should remove the plane from the airport after take off' do
      plane = Plane.new
      plane.land(airport)
      plane.take_off(airport)
      expect(airport.planes.include?(airport)).to eq false
    end
  end

end
