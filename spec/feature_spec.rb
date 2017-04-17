require 'airport'

describe 'Feature testing' do
  let(:airport) {Airport.new}
  let(:plane) {Plane.new}

  before(:each) do
    allow(airport.weather).to receive(:stormy?) {false}
  end

  context 'Plane can land in airport' do
    it 'A plane can be created and land in an airport' do
      airport.land(plane)
      expect(airport.contains?(plane)).to be true
    end
  end

  context 'Plane can take off from airport' do
    it 'A plane can land in an airport and take off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.contains?(plane)).to be false
    end
  end

  context 'Multiple operations' do
    it 'Create and land multiple planes' do
      gatwick = Airport.new
      heathrow = Airport.new
      allow(gatwick.weather).to receive(:stormy?) {false}
      allow(heathrow.weather).to receive(:stormy?) {false}
      plane2 = Plane.new
      plane3 = Plane.new
      gatwick.land(plane)
      gatwick.land(plane2)
      heathrow.land(plane3)
      gatwick.take_off(plane2)
      heathrow.land(plane2)
      heathrow.take_off(plane3)
      heathrow.land(plane3)
      expect(heathrow.contains?(plane2)).to be true
    end
  end

end
