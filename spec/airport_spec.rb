require 'airport'

describe Airport do

  let(:plane) {double(:plane)}
  context 'when a plane is landing' do
    it 'can confirm that 1 plane has landed' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.confirm_land(plane)
      expect(airport.planes.count).to eq 1
    end

    it 'can confirm that a plane has landed and is in it\'s slot' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport.confirm_land(plane)).to eq airport.planes[-1]
    end

    it 'raises an error if weather is stormy' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(true)
      expect{ airport.confirm_land(plane) }.to raise_error "Plane cannot land, it is too stormy."
    end
  end

  context 'when a plane is taking off' do
    it 'can confirm that 1 plane has taken off' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.confirm_land(plane)
      expect( airport.confirm_takeoff(plane) ). to eq subject.planes
    end

    it 'raises an error if weather is stormy' do
      airport = Airport.new
      allow(airport).to receive(:stormy?).and_return(false)
      airport.confirm_land(plane)
      allow(airport).to receive(:stormy?).and_return(true)
      expect{ airport.confirm_takeoff(plane) }.to raise_error "Plane cannot take off, it is too stormy."
    end

    it 'raises an error when the airport is empty' do
      airport = Airport.new
      expect{ airport.confirm_takeoff(:plane) }.to raise_error "There are no planes in airport."
    end
  end

end
