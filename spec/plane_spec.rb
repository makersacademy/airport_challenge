require 'plane.rb'

describe Plane do
  let(:airport) { double :airport }
  subject(:plane) { described_class.new}

  describe 'initialize' do
    it 'it initializes in the air' do
      expect(plane.landed?).to eq false
    end
  end
  describe 'landed' do
    it 'returns true is the plane has landed and is on the ground' do
      plane.land
      expect(plane.landed?).to eq true
    end
  end

  describe '#land' do
    it 'sets the planes status to landed' do
      expect(plane.land).to eq true
    end
  end

  describe '#takeoff' do
    it 'sets landed to false' do
      plane.takeoff
      expect(plane.landed?).to eq false
    end
  end
end
