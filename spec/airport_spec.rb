require 'airport'

describe Airport do
  before do
    @airport = Airport.new("good weather", 5)
  end

  it "returns weather" do
    expect(@airport.weather).to eq("good weather")
  end

  it "returns capacity" do
    expect(@airport.capacity).to eq(5)
  end
end
