require "airport"

describe Airport do
  it "has a default capacity" do
    expect(subject.airport_capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it "capacity can be overridden on initialization" do
    test_capacity = 100
    airport = Airport.new(test_capacity)
    expect(airport.airport_capacity).to eq test_capacity
  end

end