require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  
  context 'when first initialized' do
    it 'is airborne' do
      expect(plane.airborne?).to be true
    end
    it 'has not landed' do
      expect(plane.landed?).to be false
    end
  end
  
  context 'when instructed to land' do
    it 'can land and confirm that it has landed' do
      plane.land
      expect(plane.landed?).to be true 
    end
    it 'can land and confirm it is no longer airborne' do
      plane.land
      expect(plane.airborne?).to be false
    end
    it 'cannot land if it has already landed' do
      plane.land
      expect { plane.land }.to raise_error("This plane has already landed!")
    end 
  end
  
  context 'when instructed to take off' do
    it 'can take off and confirm that it is airborne' do
      plane.land
      plane.take_off
      expect(plane.airborne?).to be true
    end
    it 'can take off and confirm that it has not landed' do
      plane.land
      plane.take_off
      expect(plane.landed?).to be false
    end
    it 'cannot take off if it is already airborne' do
      expect { plane.take_off }.to raise_error("This plane is no longer in the airport!")
    end
  end

end
