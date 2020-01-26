require "airport"
require "plane"

describe Airport do
  it "check if the airport create a new plane" do
    expect(subject).to respond_to :create_plane
  end

  it "check if the airport respond to land" do
    expect(subject).to respond_to :land
  end

  it "check that the airport lands and return plane" do
    plane1 = subject.create_plane
    expect(subjext.land(plane1)).to eq [plane1]
  end
end
