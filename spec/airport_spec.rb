require "./lib/airport.rb"
require "./lib/plane.rb"
describe Airport do
  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end
  it "has a maximum capacity" do
    expect(Airport::DEFAULT_CAPACITY).to eq 20
  end
  it "has a capacity which can be changed" do
    expect(Airport.new(30).capacity).to eq(30)
  end
  it "lands a plane" do
    expect(subject.land_plane(@plane)).to eq @plane
  end
  it "tells a plane to depart" do
    expect(@airport).to respond_to :depart_plane
  end
  it "allows a plane to depart and confirm flight" do
    subject.land_plane(@plane)
    subject.depart_plane(@plane)
    expect(@plane.flying?).to eq true
  end
  it "changes a plane status when landed" do
    subject.land_plane(@plane)
    expect(@plane.flying?).to eq false
  end
  describe '#depart_plane' do
    it "raises an error when the hangar is empty" do
      expect { subject.depart_plane(@plane) }.to raise_error "No Planes in the hangar!"
    end
  end
  describe '#land_plane' do
    it 'raises an error when full' do
      20.times { subject.land_plane Plane.new }
      expect { subject.land_plane Plane.new }.to raise_error "Hangar is full!"
    end
  end
end
