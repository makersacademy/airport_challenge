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
    expect(subject.land(plane1)).to eq [plane1]
  end
  it "check if the airport respondt to landed" do
    expect(subject).to respond_to :landed
  end
  it "check if a specific plane has landed" do
    plane1 = subject.create_plane
    subject.land(plane1)
    expect(subject.landed?(plane1)).to eq true
  end
end
