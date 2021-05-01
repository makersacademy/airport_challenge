require './lib/airport.rb'
#removed instances of airport.land(plane) and put 1 plane in hangar as default
describe Plane do
  describe '#flying' do
    it 'responds to flying' do
      expect(subject).to respond_to(:flying)
    end
    it 'returns true when flying' do
      airport = Airport.new
      plane = airport.hangar[0]
      airport.take_off(plane)
      expect(plane.flying).to eq(true)
    end
    it 'returns false when plane first created' do
      expect(subject.flying).to eq(false)
    end
    it 'returns false when plane has landed' do
      airport = Airport.new
      #removed airport.land(plane) and getting the first plane in hangar instead. 
      plane = airport.hangar[0]
      airport.take_off(plane)
      airport.land(plane)
      expect(subject.flying).to eq(false)
    end
  end
end