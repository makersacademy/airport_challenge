require "airport"

describe Airport do
  it "allows an airport to exist" do
    expect(Airport.new).to be_an_instance_of(Airport)
  end
end
