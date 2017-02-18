require 'airport'

describe Airport do
  before(:each) do
    @airport = Airport.new
  end

  it "it responds to is_full?" do
    expect(@airport).to respond_to(:is_full?)
  end

  it "has a default capacity" do
    expect(@airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "default capacity can be overriden" do
    expect(Airport.new(15).capacity).to eq 15
  end
end
