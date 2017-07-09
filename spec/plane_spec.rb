require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  it {should respond_to (:instruct_to_land)}
  it {should respond_to (:landed?)}
  it {should respond_to (:take_off)}

  describe '#instruct_to_land' do
    it "tells the plane to land at the airport" do
      expect(plane.instruct_to_land).to eq "You have clearance to land the plane at the airport"
  end
end

  describe '#landed?' do
    it "confirms that the plane has landed" do
      expect(plane.landed?).to eq true
    end
  end

  describe '#take_off' do
    it "tells the plane to take off" do
      expect(plane.take_off).to eq "This is your clearance to take off from the airport"
    end
end

describe '#departed?' do
  it "checks that the plane has left the airport" do
    expect(plane.departed?).to eq true
  end
end
end
