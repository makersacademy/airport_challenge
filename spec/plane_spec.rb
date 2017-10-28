require 'plane'

describe Plane do
  let(:test_plane) { Plane.new }
  describe 'plane' do
    it 'should create a new plane' do
      expect(test_plane).to be_instance_of(Plane)
    end
  end
end
