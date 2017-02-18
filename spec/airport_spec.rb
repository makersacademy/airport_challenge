require 'airport'

describe Airport do
  let(:plane) {double(:plane)}

  it "instructs a plane to land" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "confirms the plane is in the airport" do
    # expect(subject.landed?(plane)).to eq plane
    new_plane = Plane.new
    subject.land(new_plane)
    expect(subject.in_airport).to include(new_plane)
  end

  it "instructs a plane to take off" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "confirms the plane is airborne"do
    new_plane = Plane.new
    subject.take_off(new_plane)
    expect(subject.in_air).to include(new_plane)
  end
end
