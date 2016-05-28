require 'aeroplane'

describe Aeroplane do
  describe '#landed?' do
    it 'aeroplane has landed' do
      expect(subject.landed?).to eq true
    end
  end
  describe '#land' do
    it 'ask aeroplane to land' do
      expect(subject.land(false)).to eq true
    end
  end
end
