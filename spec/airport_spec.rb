require "airport.rb"

describe Airport do
  it "should instruct a plane to land at the airport" do
    expect(subject).to respond_to :land
    # plane = Plane.new
    # subject.land(plane)
    plane = subject.land
    expect(plane).to confirm_land


#     it { is_expected.to respond_to :release_bike}
# +
# +  it "releases working bikes" do
# +    bike = subject.release_bike
# +    expect(bike).to be_working
  end
end
