require "airport"

describe Airport do

  it "allows a plane to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "allows a plane to take off" do
    expect(subject).to respond_to(:takeoff).with(1).argument
  end
end
