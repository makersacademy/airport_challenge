require 'airport'
require 'plane'

describe Airport do
  it "allows a plane to land" do
    expect(subject).to respond_to :land
  end

  it "allows a plane to takeoff" do
    expect(subject).to respond_to :takeoff
  end

  it "prevents a plane from landing when it is full" do
    20.times { subject.land(Plane.new) }
    expect { subject.land Plane.new }.to raise_error 'Airport is full - plane cannot land'
  end
end
