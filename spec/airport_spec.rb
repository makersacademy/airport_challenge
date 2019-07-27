require 'airport'

describe Airport do

  describe 'initialization' do
  subject { Airport.new }
  let(:plane) { Plane.new }
  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.land_plane(plane)
    end
    expect{ subject.land_plane(Plane.new) }.to raise_error "Cannot do that, airport full"
  end
end

  it "lands a plane" do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq [plane]
  end
  it "plane takes off" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.take_off).to eq plane
  end
  it "doesn't land plane when weather is stormy" do
    subject.conditions("stormy")
    expect { subject.land_plane(Plane.new) }.to raise_error("Cannot do that")
  end
  it "plane doesn't take off when weather is stormy" do
    subject.conditions("stormy")
    expect { subject.take_off }.to raise_error("Cannot do that")
  end
end
