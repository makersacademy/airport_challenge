require 'airport'

describe Airport do
  let(:plane) { double(:plane) }
  let(:weather){double :weather, stormy?: false}
  subject(:airport) {described_class.new weather}

  context 'airport default capacity' do

    it 'does not exceed default capacity' do
      allow(plane).to receive(:land)
      Airport::DEFAULT_CAPACITY.times{airport.land(plane)}
      expect{ airport.land(plane)}.to raise_error 'Airport is full'
    end
  end

  context 'airport default capacity overridden' do
    NEW_AIRPORT_CAPACITY = 20
    subject(:airport) {described_class.new weather, NEW_AIRPORT_CAPACITY }
    it 'airport default capacity can be overridden' do
      allow(plane).to receive(:land)
      NEW_AIRPORT_CAPACITY.times{airport.land(plane)}
      expect{ airport.land(plane)}.to raise_error 'Airport is full'
    end
  end

  context 'dispatched plane not at airport' do
    it 'a plane can only take off if it is at the airport' do
      expect{ airport.dispatch(plane)}.to raise_error 'Plane is not at airport'
    end
  end

  context 'land plane in good weather' do
    it 'a plane can land at the airport' do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  context 'land plane in bad weather' do
    it 'a plane cannot land at the airport in bad weather' do
      allow(plane).to receive(:land)
      allow(weather).to receive(:stormy?) {true}
      expect{ airport.land(plane)}.to raise_error 'Weather is stormy'
    end
  end

  context 'dispatch plane in good weather' do
    it 'a plane can be dispatched in good weather' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      airport.land(plane)
      airport.dispatch(plane)
      expect( airport.planes).not_to include plane
    end
  end

  context 'dispatch plane in bad weather' do
    it 'a plane cannot be dispatched in bad weather' do
      allow(plane).to receive(:land)
      airport.land(plane)
      allow(weather).to receive(:stormy?) {true}
      expect{ airport.dispatch(plane)}.to raise_error 'Weather is stormy'
    end
  end



end

