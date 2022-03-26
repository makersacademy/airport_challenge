require 'plane'

describe Plane do

  describe '#landed' do

    it 'checks the plane has landed' do
      expect(subject.landed).to eq true
    end
  end

  describe '#taken_off' do

    it 'checks the plane has taken off' do
      expect(subject.taken_off).to eq false
    end
  end
end
