require 'plane'

describe Plane do
  subject(:plane) { Plane.new }
  # let(:airport) { double :airport }
  
  describe '#taken_off' do
    it { is_expected.to respond_to :taken_off }
    
    it 'confirms plane has taken off' do
      plane.taken_off
      expect(plane.flying?).to be true
    end
  end

  describe '#landed' do
    it { is_expected.to respond_to :landed }
    
    it 'confirms plane has landed' do
      plane.landed
      expect(plane.flying?).to be false
    end
  end
end
