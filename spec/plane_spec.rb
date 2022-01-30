require './docs/plane'

describe Plane do
  describe "#confirm_take_off" do
    it "should confirm that it has taken off" do
      aeroplane = Plane.new
      expect(aeroplane).to respond_to(:confirm_take_off)
    end
  end
end
