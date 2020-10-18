require 'airport2'

RSpec.describe Airport do

  it "initisalises with a default capacity that can be overridden" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    airport = Airport.new(20)
    expect(airport.capacity). to eq 20
  end

  it "checks if airport is full" do
    airport = Airport.new(0) # capacity = 0
    actual_value = airport.full?
    expected_value = true
    expect(actual_value).to eq expected_value
  end

  it "it checks if weather is stormy" do
    expect(subject).to respond_to :stormy?
  end

end
