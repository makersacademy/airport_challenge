require "airport"

describe Airport do

  let(:airport) { Airport.new }

  it "allows an airport to exist" do
    expect(Airport.new).to be_an_instance_of(Airport)
  end

  it "allows landing at an airport" do
    expect(airport).to respond_to(:land)
  end

  it "allows landing to have an argument" do
    expect(airport).to respond_to(:land).with(1).argument
  end

end
