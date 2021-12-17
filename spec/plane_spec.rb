require 'plane'

describe Plane do
  let(:airport) {Airport.new}
  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it 'lands at an airport' do
      
      expect(subject.land(airport)).to eq airport  
    end
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
  describe '#take_off' do
    it 'lands at an airport' do
      
      expect(subject.take_off(airport)).to eq airport  
    end
  end
end
