#As an air traffic controller
#So I can get passengers to a destination
#I want to instruct a plane to land at an airport

describe Airport do
  it "Expects plane to land at an airport" do
    expect(subject).to respond_to(:land_plane)
  end
end
