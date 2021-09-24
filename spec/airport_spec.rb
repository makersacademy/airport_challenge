require "airport"
CAPACITY = 20

describe "Airport" do
  before(:each) do
    @test_airport = Airport.new(CAPACITY)
  end

  it "should have a capacity" do
    expect(@test_airport.capacity).to eq(CAPACITY)
  end
end