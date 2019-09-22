require 'airport'
require 'plane'

describe Plane do
  subject(:plane) { described_class.new }   
  
  describe '#flying' do
    it 'registers true after taking off' do
      subject
      airport = Airport.new
      airport.take_off(plane)
      expect(plane.flying).to eq true
    end
  end

  describe '#landed' do
    it 'registers true after landing' do
      subject
      airport = Airport.new
      airport.land(plane)
      expect(plane.landed).to eq true    
    end
 
    it 'raises an error if a plane that has landed tries to land again' do
      subject
      airport = Airport.new
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error("PlaneAlreadyLanded")
    end
  end  
end
