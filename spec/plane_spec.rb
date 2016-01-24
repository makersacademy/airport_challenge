require 'plane'

describe Plane do

  subject(:plane) { described_class.new }

  describe '#initialize' do

    it 'initializes as airborne' do
      expect(subject.airborne).to eq true
    end

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
