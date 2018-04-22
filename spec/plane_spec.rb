require 'plane'

describe Plane do

  describe '#land' do
    it 'lands in airport when instructed by air traffic controller' do
      subject.land
      expect(subject.landed).to eq true
    end

    it 'raises an error when plane tries to lands if already landed' do
      subject.land
      expect { subject.land
      }.to raise_error "Plane is already landed in an airport!"
    end
  end

  describe '#take_off' do
    
    it 'takes off from airport when instructed by air traffic controller' do
      subject.take_off
      expect(subject.landed).to eq false
    end
  end

end
