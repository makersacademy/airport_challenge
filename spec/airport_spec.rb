require "airport"

describe Airport do
  let(:plane){double :plane, :flying => false}

  it "has an empty array to store plane objects" do
    expect(subject.planes).to eq []
  end

  it "has a maximum capacity" do
    expect(subject.capacity).to eq 20
  end

  describe "full" do
    it "should return true if airport is full" do
      20.times {subject.planes << plane}
      expect(subject).to be_full
    end

  end

  # describe "land_plane" do
  #   it "should load plane into airport.planes array" do
  #     subject.land_plane(plane)
  #     expect(subject.planes).to eq [plane]
  #   end


  # end

end
