require "airport"

describe Airport do

  it 'allows airplanes to land and confirms arrival' do
    plane = Plane.new
    expect(subject.allows_landing(plane)).to eq "Aircraft #{plane} has landed"
  end
  it "allows airplanes to take off and confirms departure" do
    plane = Plane.new
    subject.allows_landing(plane)
    expect(subject.allows_takeoff).to eq "Aircraft #{plane} has departed"
  end
end
