require 'plane'

describe Plane  do
  let(:plane) { described_class.new }

  describe '#initialize' do
    it 'landed set to false when initialized' do
      expect(plane.status).to eq false
    end
  end

  describe '#land' do
    it 'landed set to true when plane landed' do
      plane.land
      expect(plane.status).to eq true
    end
  end

  describe '#take_off' do
    it 'sets landed to false' do
      plane.take_off
      expect(plane.status).to eq false
    end
  end

end
