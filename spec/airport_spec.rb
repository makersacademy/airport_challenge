require "./lib/airport.rb"
require "./lib/plane.rb"

describe Airport do
  airport = Airport.new
  it "lands a plane" do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq [plane]
  end
  it "allows a plane to depart and confirm flight" do
    plane = Plane.new
    subject.land_plane(plane)
    subject.depart_plane
    expect(plane.flying?).to eq true
  end
    describe '#depart_plane' do
      it "raises an error when the hangar is empty" do
        expect { subject.depart_plane }.to raise_error "No Planes in the hangar!"
      end
    end

    describe '#land_plane' do
      it 'raises an error when full' do
        20.times { subject.land_plane Plane.new }
        expect { subject.land_plane Plane.new }.to raise_error "Hangar is full!"
      end
    end
end
