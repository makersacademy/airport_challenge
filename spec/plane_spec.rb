require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  it {should respond_to (:instruct_to_land)}
  it {should respond_to (:landed?)}

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

end
