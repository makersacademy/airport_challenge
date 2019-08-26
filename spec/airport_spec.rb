require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected. to respond_to(:take_off).with(1).argument }
  it { is_expected. to respond_to(:plane) }

  describe '#land' do
  it "returns a plane when a plane lands at the airport" do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
end

  describe '#take_off' do
  it "raises an error if a plane tries to take off from an empty airport" do
    expect { subject.take_off(Plane.new) }.to raise_error ("No planes available")
  end
end

end

#("No planes available")
