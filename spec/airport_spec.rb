require 'airport'

describe Airport do
  let(:airport) { Airport.new }

  let(:plane) { double :plane, status: 'landed' }

  it "is an airport" do
    expect(subject).to be_an_instance_of(Airport)
  end

  it "instruct a plane to land at an airport" do
    plane_double = double
    expect(subject).to respond_to(:land)
  end

  it "plane passed as an argument for landing" do
    plane_double = double('plane_double', status: 'landed')
    expect(subject.land(plane_double))
  end

  it "Plane returns a status of landed" do
    plane_double = double('plane_double', status: 'landed')
    expect(subject.land(plane_double)).to eq('landed')
  end

  it "instruct a plane to take off" do
    plane_double = plane_double
    expect(subject).to respond_to(:takeoff)
  end

  it "when plane is instructed to take-off" do
    plane_double = double('plane_double', status: 'landed')
    expect(subject.takeoff(plane_double))
  end

  it "take-off from an airport and confirm that it is no longer in the airport" do
    plane_double = double('plane_double', status: 'landed')
    subject.land(plane_double)
    subject.takeoff(plane_double)
    expect(subject.hanger).not_to include(plane_double)
  end

  it "return plane hasn't taken off, confirm it is still in the hanger" do
    plane_double = double('plane_double', status: 'landed')
    subject.land(plane_double)
    expect(subject.hanger).to include(plane_double)
  end

  it "when weather is stormy, plane can not takeoff" do
    plane_double = double('plane_double', status: 'landed')
    allow(subject.stormy?).to receive(:stormy)
    subject.land(plane_double)
    expect { subject.safety }.to raise_error("No flying today, weather is stormy.")
  end

end
