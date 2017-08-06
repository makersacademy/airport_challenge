require_relative '../lib/airport'

describe Airport do
  subject { described_class.new }


  it "Lets plane land in airport" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it "Confirms plane has left airport" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end



  #it "Plane can't land in stormy weather" do
    #weather = instance_double("Airport", :weather => 9)
    #airport = double("airport")
    #airport = Airport.new
   # allow(airport).to receive(:@weather).and_return(9)
    #plane = Plane.new
    #expect(lambda { Airport.new.land_plane(plane) }).to raise_error("Weather is too stormy to land")
    #expect { subject.land_plane(plane) }.to raise_error "Weather is too stormy to land"
  #end


  it "Airport is full" do
    plane = Plane.new
    airport = Airport.new
    subject.capacity.times { airport.land_plane(plane) }
    expect { airport.land_plane(plane) }.to raise_error "Airport is full"
  end

  it "Sets a default capacity of 2 when not otherwise specified" do
    expect(Airport.new.capacity).to eq 2
  end
  
  it "Default capacity can be overridden and set by System Designer" do
    expect(Airport.new(5).capacity).to eq 5
  end
  


end
 