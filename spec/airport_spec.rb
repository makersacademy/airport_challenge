require 'airport'

describe Airport do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport
  it "can land a plane" do
    expect(subject).to respond_to(:land).with(1)
  end


end
