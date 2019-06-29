require 'airport'

describe Airport do

  describe "#runway_land" do
    it "allows planes to land on it" do
      plane1 = double(:plane1)
      expect(subject.runway_land(plane1)).to eq(plane1)
    end
  end
end
