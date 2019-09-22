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
  end  
end
