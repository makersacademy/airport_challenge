require 'plane'

describe Plane do

  describe '#land' do
    it 'lands in airport when instructed by air traffic controller' do
      subject.land
      expect(subject.landed).to eq true
    end
  end

  describe '#take_off' do
    it 'takes off from airport when instructed by air traffic controller' do
      subject.take_off
      expect(subject.landed).to eq false 
    end
  end

end
