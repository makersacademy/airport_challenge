require "airport"

describe Airport do
  let(:plane){double :plane}

  it "has an empty array to store plane objects" do
    expect(subject.planes).to eq []
  end

  describe "land_plane" do
    it "should load plane into airport.planes array" do
      subject.land_plane(plane)
      expect(subject.planes).to eq [plane]
    end
  end
  
end
