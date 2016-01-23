require 'plane'

describe Plane do

  describe '#initialize' do

    it {is_expected.to respond_to :airborne}

  end

  describe '#landed' do

    it 'reports as landed and not airborne' do
      expect(subject.landed).to eq false
    end

  end

  describe '#departed' do

    it 'reports as departed and airborne' do
      expect(subject.departed).to eq true
    end

  end

end
