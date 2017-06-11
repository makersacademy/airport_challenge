require 'Plane'

describe Plane do
  it { is_expected.to respond_to(:status) }

  it { is_expected.to respond_to(:ground) }

  it { is_expected.to respond_to(:fly) }

  describe "#ground" do
    it "should change the status of the plane to grounded" do
      plane = Plane.new
      plane.ground
      expect(plane.status).to eq("landed")
    end
  end

  describe "#fly" do
    it "should change the status of the plane to airborne" do
      plane = Plane.new
      plane.ground
      plane.fly
      expect(plane.status).to eq("airborne")
    end
  end

end
