require "airport"

describe AirPort do
  port = AirPort.new
  it "Check if airport exist" do
    expect(port).to exist
  end 
end