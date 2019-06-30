require 'airport'

describe Airport do

  let(:plane) { double :plane }

  it "lands a plane" do
    subject.safe_to_fly = true
    subject.land_plane(plane)
    expect(subject.current_aircraft).to include(plane)
  end

  it "removes a plane from the airport" do
    subject.safe_to_fly = true
    subject.land_plane(plane)
    subject.take_off_plane(plane)
  end

  it "Error 'Too Stormy to take off' when stormy and takeoff attempted" do
    # subject.safe_to_fly = true
    # subject.land_plane(plane)
    subject.safe_to_fly = false
    expect(subject.take_off_plane(plane)).to raise_error("Too Stormy to take off")
  end

  it "Error 'Too Stormy to land' when stormy and landing attempted" do
    subject.safe_to_fly = false
    expect(subject.land_plane(plane)).to raise_error
  end

end
