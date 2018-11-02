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
  it "expects #takeoff not to run if weather is stormy" do
    stansted = Airport.new("stormy")
    expect { stansted.takeoff }.to raise_error "The weather is stormy, we cannot take off."
  end
end