require 'airplane.rb'
require 'airport.rb'

describe "airport" do
  it 'has weather' do
    airport = Airport.new
    airport.set_weather("stormy")
    expect(airport.get_weather).to eq "stormy"
  end

  it "has capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq 10
  end

  it "airport is full" do
    airport = Airport.new
    airport.capacity
    expect(airport.is_full?).to eq true
  end
end
