require 'airport'

describe Airport do
  let(:plane) { double :plane }

  it "expects to see a plane in its hangar after telling it to land" do
    expect(subject.land(plane).last).to eq plane
  end

  it "expects to see a plane has left its hangar after telling it to take-off" do
    expect(subject.take_off(plane)).to eq plane
  end

end