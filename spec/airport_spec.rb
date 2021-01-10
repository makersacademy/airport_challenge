require 'airport'

require 'plane'

describe Airport do
  it 'responds to the land method' do
    #airport = Airport.new
    expect(subject).to respond_to :land
  end

  it "to land a plane at an airport" do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq [plane]
  end

  it "responds to the take_off method" do
    expect(subject).to respond_to :take_off
  end

  it "to take_off a plane and confirm it left airport" do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.take_off).to eq [plane] #be_instance_of(Plane)
  end

  it "responds to planes" do
    expect(subject).to respond_to :planes
  end

  it "test that the default capacity is 20" do
    expect(subject.capacity).to eq 20
  end

end
