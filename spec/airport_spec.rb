require 'airport'

describe Airport do
  let(:plane) {double(:plane)}

  it 'checks whether or not a plane is in the airport after landing and takeoff' do
    plane = Plane.new
    plane.land(subject)
    expect(subject.check_plane_status(plane)).to eq "Plane in airport"
    plane.takeoff(subject)
    expect(subject.check_plane_status(plane)).to eq "Plane not in airport"
  end

  it 'raises an error if a plane tries to land when the airport is full' do
    allow(subject).to receive(:stormy?) {false}
    #allow(plane).to receive(:land).with(subject)
    Airport::DEFAULT_CAPACITY.times {Plane.new.land(subject)}
    expect{subject.cleared_for_landing(plane)}.to raise_error("The airport is full.")
  end

  it 'raises an error if a plane tries to land or take off when the weather is stormy' do
    allow(subject).to receive(:stormy?) {true}
    expect{subject.cleared_for_landing(plane)}.to raise_error("It's too stormy to land.")
    expect{subject.cleared_for_takeoff(plane)}.to raise_error("It's too stormy to take off.")
  end

end
