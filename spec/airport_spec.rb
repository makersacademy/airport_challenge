require_relative '../lib/airport'

describe Airport do

  subject { described_class.new }

  it "Lets plane land in airport" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "Confirms plane has left airport" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  #it "Does not allow planes to land when the airport is full" do
    #plane = Plane.new
    #airport = Airport.new
    #p subject.capacity.times{airport.land_plane(plane)}
    #expect {subject.land_plane(plane)}.to raise_error "Airport is full"
  #end

  it "Airport is full" do
    plane = Plane.new
    airport = Airport.new
    subject.capacity.times {airport.land_plane(plane)}
    expect {airport.land_plane(plane)}.to raise_error "Airport is full"
    end

end
 