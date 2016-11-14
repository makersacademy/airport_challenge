require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do

context "sunny" do

before do
  allow(subject.weather).to receive(:stormy?) {false}
end

  it "allows a plane to land" do
    expect(subject.land_plane(@plane)).to eq subject.planes
  end

  it "allows a plane to takeoff" do
    subject.land_plane(@plane)
    expect(subject.take_off(@plane)).to eq subject.plane
  end

  it "confirms that a plane is no longer in the airport" do
    subject.land_plane(@plane)
    subject.take_off(@plane)
    expect(subject.number_of_planes).to eq 0
  end

  it "prevents landing if the airport is full" do
    5.times { subject.land_plane(@plane) }
    expect { subject.land_plane(@plane) }.to raise_error "Plane cannot land if airport is full"
  end

end

context "stormy" do

  it "won't let a plane land when the weather is stormy" do
    allow(subject.weather).to receive(:stormy?) {true}
    expect { subject.land_plane(@plane) }.to raise_error "Plane cannot land in stormy weather"
  end

  it "won't let a plane takeoff when the weather is stormy" do
    allow(subject.weather).to receive(:stormy?) {false}
    subject.land_plane(@plane)
    allow(subject.weather).to receive(:stormy?) {true}
    expect { subject.take_off(@plane) }.to raise_error "Plane cannot takeoff in stormy weather"
  end

end

end
