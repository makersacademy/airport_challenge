require 'Plane'

describe Plane do
  it { is_expected.to respond_to(:status) }

  it { is_expected.to respond_to(:ground) }

  describe "#ground" do
    it "should change the status of the plane to grounded" do
      plane = Plane.new
      plane.ground
      expect(plane.status).to eq("landed")
    end
  end

end
