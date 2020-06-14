require 'plane'

describe Plane do
    
  let(:plane) { Plane.new }
  
  describe '#flying?' do
    it 'plane should be flying at the start' do
      expect(plane).to be_flying
    end
  end
  
  describe '#landed?' do
    it 'should not be flying when plane has landed' do
      expect(plane).not_to be_landed
    end
  end
  
  describe '#taken_off?' do
    it 'should be true if plane has taken_off' do
      expect(plane).to be_flying
    end
  end
end
