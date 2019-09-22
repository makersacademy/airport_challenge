require 'plane'

describe Plane do

  subject(:plane) { described_class.new }
  
  it 'creates a new plane' do
    expect(plane).to eq plane  
  end

  describe '#grounded' do
    it 'describes the state of a plane' do
      expect(plane.grounded?).to eq false
    end
  end

  describe '#land' do
    it 'changes the grounded state of a plane from false to true' do
      plane = Plane.new
      plane.land
      expect(plane.grounded?).to eq true
    end
  end

  describe '#fly' do
    it 'changes the grounded state of a plane from true to false' do
      plane = Plane.new
      plane.land
      plane.fly
      expect(plane.grounded?).to eq false
    end
  end
end
