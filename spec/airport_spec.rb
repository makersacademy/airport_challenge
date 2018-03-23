require "airport"

describe Airport do
  let(:airport) { described_class.new }

  it "Has a default capacity if one is not set by the user" do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "sets the capacity to another number if passed as an argument" do
    expect(Airport.new(300).capacity).to eq 300
  end

  it "raises an error if the capacity passed is not an integer" do
    message = "The capacity specified was not a number!"
    expect { Airport.new("a string instead of an integer") }.to raise_error message
  end

  it "raises an error if the capacity specified is negative" do
    message = "The capacity must be a positive number!"
    expect { Airport.new(-256) }.to raise_error message
  end

end
