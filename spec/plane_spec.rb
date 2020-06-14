require 'plane'

describe Plane do
    
  let(:plane) { Plane.new }
  
  describe '#flying?' do
    it 'should determine what the planes flying status is' do
    expect(plane.flying?).to be_flying
    end
  end
  
  describe '#landed?' do
    it 'should be true if plane is landed' do
    expect(plane.landed?).to be_landed
    end
  end
  
  describe '#taken_off?' do
    it 'should be true if plane has taken_off' do
    expect(plane.taken_off?).to have_taken_off
    end
  end
end
