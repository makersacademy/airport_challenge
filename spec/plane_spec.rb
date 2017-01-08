require "plane.rb"

describe Plane do
  subject(:plane) { described_class.new }
  subject(:plane1) { described_class.new(true) }
  subject(:plane2) { described_class.new(false) }

  describe 'check basic functions' do
    it 'plane exists' do
      expect(plane).to be_a(Plane)
    end
    it 'plane can fly, true by default' do
      expect(plane.status).to eq(true)
    end
  end

  describe 'flight status can be assigned when the class is created' do
    it 'can assign no status to plane, true by default' do
      expect(plane.status).to eq(true)
    end

    it 'can assign true status to plane' do
      expect(plane1.status).to eq(true)
    end

    it 'can assign false status to plane' do
      expect(plane2.status).to eq(false)
    end
  end

end
