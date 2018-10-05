require 'airport'
require 'pry'

describe Airport do
  let(:airport) { subject }
  let(:plane) { double(:plane) }

  it "tracks number of planes in airport with #full?" do
    5.times { airport.planes << plane }
    expect(airport).to be_full
  end

  it "can be given a new capacity" do
    airport = Airport.new(10)
    10.times { airport.planes << plane }
    expect(airport).to be_full
  end

  it "has weather" do
    expect(airport.weather).not_to be_nil
  end
end
