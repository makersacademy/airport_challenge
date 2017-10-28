require 'plane'

describe Plane do
  let(:test_plane) { Plane.new }
  describe 'plane' do
    it 'should create a new plane' do
      expect(test_plane).to be_instance_of(Plane)
    end
  end
  describe 'land' do
    it 'should send allow the plane to land' do
      expect(test_plane).to respond_to(:land)
    end

    it 'should send allow the plane to land at an Airport' do
      expect(test_plane).to respond_to(:land).with(1).argument
    end
  end
end
