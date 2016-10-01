require 'airport'

describe Airport do

  before(:each) do
    @airport = Airport.new
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

end
