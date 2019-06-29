require 'airport'
require 'plane'

describe Airport do
  it 'Plane lands in airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq true
  end

  it 'Plane takes off from airport' do
    plane = Plane.new
    expect(subject.takeoff(plane)).to eq true
  end

  it "Plane confirms it's taken off" do
    plane = Plane.new
    expect(subject.confirm(plane)).to eq 1
  end
end
