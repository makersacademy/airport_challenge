require 'airport.rb'

describe Airport do
  it "responds to #land_plane" do
    expect(subject.respond_to?('land_plane')).to eq true
  end

  it "returns a plane when a plane is instructed to land" do
    plane = Plane.new
    expect(subject.land_plane).to be_instance_of(Plane)
  end

end
