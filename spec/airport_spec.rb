require 'airport'
describe Airport do
  it "returns an instance of Airport" do
    airport = Airport.new('max_capacity', 'location')
    expect(airport).to be_an_instance_of(Airport)
  end
  it "responds to is_full" do
    airport = Airport.new('max_capacity', 'location')
    expect(airport).to respond_to(:is_full)
  end
  it "responds to get_weather" do
    airport = Airport.new('max_capacity', 'location')
    expect(airport).to respond_to(:get_weather)
  end
  it "responds to add_plane" do
    airport = Airport.new('max_capacity', 'location')
    expect(airport).to respond_to(:add_plane)
  end
  it "responds to remove_plane" do
    airport = Airport.new('max_capacity', 'location')
    expect(airport).to respond_to(:remove_plane)
  end
  it "raises an error when the airport is full" do
    airport = Airport.new('20', 'location')
    airport.actual_capacity = '20'
    expect(airport.is_full).to be true
  end

  it "returns false when the airpot is not full" do
    airport = Airport.new('20', 'location')
    airport.actual_capacity = '3'
    expect(airport.is_full).to be false
  end
  
  it "returns stormy or sunny when calling get_weather" do
    airport = Airport.new('max_capacity', 'location')
    expect(airport.get_weather).to eq(:sunny).or eq(:stormy)
  end

  it "raises an error when add a plan when the airport is full" do
    airport = Airport.new('20', 'location')
    airport.actual_capacity = '20'
    expect { airport.add_plane }.to raise_error(RuntimeError, "The airport is full")
  end
  it "accepts a new plane in the airport when the airport is not full" do
    airport = Airport.new('20', 'location')
    airport.actual_capacity = 3
    airport.add_plane
    expect(airport.actual_capacity).to eq(4)
  end

  it "removes a new plane from the airport" do
    airport = Airport.new('20', 'locaction')
    airport.actual_capacity = 3
    airport.remove_plane
    expect(airport.actual_capacity).to eq(2)
  end

end
