require 'plane'

describe Plane do

  describe '#land' do
    it 'lands in airport when instructed by traffic controller' do
      subject.land
      expect(subject.flying).to eq false
    end
  end

  describe '#takeoff' do
    it 'takes off from airport when instructed by traffic controller' do
      subject.take_off
      expect(subject.flying).to eq true
    end
  end
end
