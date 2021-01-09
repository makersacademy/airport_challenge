require 'airport'
require 'plane'

describe Airport do
  it "responds to land_plane" do
    expect(subject).to respond_to(:land_plane)
  end

  it 'adds plane to the runway if landing is approved' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.runway).to include(plane)
  end

  it "responds to take_off" do
    expect(subject).to respond_to :take_off
  end

  it "gives permission for take off" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq true unless plane.flying? == true
  end

  it "prevents landing when the runway is full (capacity is 20 planes)" do
    20.times { subject.land_plane Plane.new }
    expect { subject.land_plane Plane.new }.to raise_error "Runway full: maintain holding pattern"
  end

end
