require 'aeroplane'

describe Aeroplane do

  describe '#landed?' do
    it 'aeroplane has landed' do
      expect(subject.landed?).to eq true
    end
  end

  describe '#land' do
    it 'ask aeroplane to land' do
      # w = double()
      # w.stub("has the is_stormy value"){false}
      w = Weather.new(false)
      expect(subject.land(w)).to eq true
    end
    it 'prevents landing if weather is stormy' do
      w = Weather.new(true)
      expect(subject.land(w)).to eq false
    end
    it 'prevents landing if airport is full' do
      w = Weather.new
      air2 = Airport.new(25,25)
      ab = air2.full?
      expect(subject.land(w, ab)).to eq false
    end
  end

  describe '#taken_off?' do
    it 'aeroplane has taken off' do
      expect(subject.taken_off?).to eq true
    end
  end

  describe '#take_off' do
    it 'asks aeroplane to take off' do
      w = Weather.new(false)
      expect(subject.take_off(w)).to eq true
    end

    it 'prevents takeoff if weather is stormy' do
      w = Weather.new(true)
      expect(subject.take_off(w)).to eq false
    end
  end

end
