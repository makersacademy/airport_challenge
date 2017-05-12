require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  
  describe '#land' do
    it 'can land on airport' do
      expect(subject.land(Airport.new))
    end

    it 'confirms when lands' do
      expect(subject.land(Airport.new)).to eq true
    end
  end

end