require 'airport'

describe 'airport' do
  describe '#plane_landing' do
    it 'responds to a method allowing planes to land' do
      expect(Airport.new).to respond_to :plane_landing
    end
    it 'prevents landing when the weather is stormy' do
      airport = Airport.new
      expect(airport.plane_landing).to raise_error ('Landing not possible')
      allow(plane_landing).to receive(:stormy?) { "stormy" }
    end
  end

  describe '#plane_taking_off' do
    it 'responds to a method allowing a plane to take off' do
    airport = Airport.new
    expect(airport).to respond_to :plane_taking_off
    end
    it 'prevents takeoff when the weather is stormy' do
      airport = Airport.new
      expect(airport.plane_taking_off).to raise_error ('Landing not possible')
      allow(plane_taking_off).to receive(:stormy?) { "stormy" }
    end
  end

  it 'confirms that a plane has left the airport after takeoff' do
    airport = Airport.new
    expect(airport).to respond_to :takeoff_confirmation
  end

  it 'prevents landing when the airport is full' do
    airport = Airport.new
    expect(airport.plane_landing).to raise_error ('The airport is full')
  end
end
