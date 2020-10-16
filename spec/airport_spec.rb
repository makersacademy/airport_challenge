require 'airport'

RSpec.describe Airport do

  it "initialises with default capacity unless overridden" do
    airport1 = Airport.new
    airport2 = Airport.new(15)
    expect(airport1.capacity).to eq Airport::DEFAULT_CAPACITY
    expect(airport2.capacity).to eq 15
  end

  it "checks if airport is full" do
    airport = Airport.new(0)
    expect(airport.full?).to eq true
  end

  it "checks if airport is stormy" do
    airport = Airport.new
    expect(airport).to respond_to(:stormy?)
  end

end
