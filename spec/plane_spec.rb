require "plane.rb"

describe Plane do
  describe 'check plane basic functions' do
    it 'plane exists' do
      expect(subject).to be_a(Plane)
    end
    it 'plane can fly, true by default' do
      expect(subject.status).to eq(true)
    end
  end

  describe 'flight status can be assigned when the class is created' do
    it 'can assign no status to plane, true by default' do
      expect(subject.status).to eq(true)
    end

    it 'can assign true status to plane' do
      plane = Plane.new(true)
      expect(plane.status).to eq(true)
    end

    it 'can assign false status to plane' do
      plane = Plane.new(false)
      expect(plane.status).to eq(false)
    end
  end

end
