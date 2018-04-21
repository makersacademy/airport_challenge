require 'plane'

describe Plane do

  describe '#land' do
    it 'lands in airport when instructed by traffic controller' do
      subject.land
      expect(subject.landed).to eq true
    end
  end
end
