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
  describe '#taken_off?' do
    it 'aeroplane has taken off' do
      expect(subject.taken_off?).to eq true
    end
  end
  describe '#take_off' do
    it 'ask aeroplane to take off' do
      expect(subject.take_off(false)).to eq true
    end
  end
end
