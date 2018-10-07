require 'weather'

describe Weather do

  describe '#stromy?' do
    
    context 'sunny' do
      subject { 
        rng = double :random, :rand => 42
        Weather.new(rng) 
      }
      it 'has a method to check stromy weather' do
        expect(subject).to respond_to(:stormy?).with(1).argument
      end

      it 'is sunny, if random number is below 90' do
        airport = double :airport
        expect(subject.stormy?(airport)).to eq false
      end
    end

    context 'stormy' do
      subject { 
        rng = double :random, :rand => 99
        Weather.new(rng) 
      }
      it 'is stormy, if random number is above 90' do
        airport = double :airport
        expect(subject.stormy?(airport)).to eq true
      end

    end
  end
end
