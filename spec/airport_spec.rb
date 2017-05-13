require "airport"

describe Airport do
  it "has a default capacity" do
    expect(subject.airport_capacity).to eq Airport::DEFAULT_CAPACITY
  end

end