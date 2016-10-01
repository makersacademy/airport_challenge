require 'airport'

describe Airport do

  before(:each) do
    @airport = Airport.new
    #Forcing the method stormy to return false with allow
    allow(@airport).to receive_messages(:stormy? => false)
    @plane = Plane.new
  end

  it "Test for existance of an airport" do
    expect(subject).to be_a Airport
  end

  it "Should allow a plane to land" do
    expect(@airport).to respond_to :land_plane
    @airport.land_plane(@plane)
    expect(@airport.planes).to eq [@plane]
    expect(@airport.land_plane(@plane)).to eq "Plane #{@plane} landed"
  end

  it "Should allow planes to take off" do
    expect(@airport).to respond_to :take_off
    @airport.land_plane(@plane)
    @airport.take_off
    expect(@airport.planes).to eq []
    expect(@airport.take_off).to eq "#{@airport.flight_log.last}"
  end

  it "Should not allow take off of landing during bad weather" do
    #Forcing :stormy to return true
    allow(@airport).to receive_messages(:stormy? => true)
    expect{@airport.land_plane(@plane)}.to raise_error("Cannot land due to bad weather")
    expect{@airport.take_off}.to raise_error('Cannot take off due to bad weather')
  end

  it "Airport should have definable capacity" do
    #Testing automatic capacity
    capacity_airport = Airport.new
    expect(capacity_airport).to have_attributes(:capacity => 10)

    #Testing definable capacity
    capacity_airport = Airport.new(15)
    expect(capacity_airport).to have_attributes(:capacity => 15)
  end

  it "Planes should not be able to land if capacity is full" do
    10.times do @airport.land_plane(Plane.new) end
    expect{@airport.land_plane(@plane)}.to raise_error('Cannot land due to no capacity')
  end

end
