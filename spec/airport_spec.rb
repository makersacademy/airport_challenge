require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) {double :plane}


  it "checks plane has landed" do
    plane = double(:plane, landed: true)
    expect(subject.land(plane)).to include plane
  end

  it "plane can't land if airport is full" do
    plane = double(:plane, landed: true)
    subject.capacity.times {subject.land(plane)}
    expect {subject.land(plane)}.to raise_error("Airport full")
  end

  it "Checks default maximum capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end
