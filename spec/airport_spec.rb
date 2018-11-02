require "airport"

describe Airport do
  it "expects a plane to #land" do
    expect(subject).to respond_to(:land)
  end
  # it "expects a plane to #takeoff" do
  #   expect(subject).to respond_to(:takeoff)
  # end
  it "expects #takeoff to return a message" do
    expect(subject.takeoff).to eq "We're now in the sky, not the airport."
  end
end