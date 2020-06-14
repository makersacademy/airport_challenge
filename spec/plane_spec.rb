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
      subject.landed?
      expect(subject).not_to be_flying
    end
    
    it 'plane should respond to land method' do
      expect(subject).to respond_to(:landed)
    end
  
    it 'raises an error if plane has already landed' do
      plane.landed?
      expect { plane.landed? }.to raise_error "Plane has already landed"
    end
  end
  
  describe '#taken_off?' do
    it 'should be true if plane has taken_off' do
      subject.taken_off?
      expect(subject).to be_flying
    end
    
    it 'plane should be able to land' do
      subject.taken_off?
      subject.landed?
      expect(subject).not_to be_flying
    end
  end
end
