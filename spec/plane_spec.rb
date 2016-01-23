require 'plane'

describe Plane do

  describe '#instruct_to_land' do
    it "respond to instruct_to_land" do
      plane = Plane.new
      expect(plane).to respond_to :instruct_to_land
    end
  end

  describe '#has_landed' do
    it "respond to has_landed" do
      plane = Plane.new
      expect(plane).to respond_to :has_landed
    end
  end

end
