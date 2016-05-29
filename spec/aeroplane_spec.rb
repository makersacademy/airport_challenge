require 'aeroplane'

describe Aeroplane do

  describe '#landed?' do
    it 'aeroplane has landed' do
      expect(subject.landed?).to eq true
    end
  end

  describe '#land' do
    it 'ask aeroplane to land' do
      w = double("Weather Object", stormy?:false)
      expect(subject.land(w, false)).to eq true
    end
    it 'prevents landing if weather is stormy' do
      w = double("Weather Object", stormy?:true)
      expect(subject.land(w)).to eq false
    end
    it 'prevents landing if airport is full' do
      w = double("Weather Object", stormy?: false)
      ab = double("Airport Object", full?:true)
      expect(subject.land(w, ab.full?)).to eq false
    end
  end

  describe '#taken_off?' do
    it 'aeroplane has taken off' do
      expect(subject.taken_off?).to eq true
    end
  end

  describe '#take_off' do
    it 'asks aeroplane to take off' do
      w = double("Weather Object", stormy?: false)
      expect(subject.take_off(w)).to eq true
    end

    it 'prevents takeoff if weather is stormy' do
      w = double("Weather Object", stormy?: true)
      expect(subject.take_off(w)).to eq false
    end
  end

end
