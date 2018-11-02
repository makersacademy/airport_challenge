require 'airport'

describe Airport do
  it { is_expected.to respond_to :plane }
end

describe Airport do
  it { is_expected.to respond_to :land_plane }
end

describe Airport do
  it { is_expected.to respond_to :take_off }
end

describe Airport do
  it { is_expected.to respond_to(:land_plane).with(1) }
end

# describe Airport do
#   it 'lands one plane' do
#     plane = Plane.new
#     subject.land_plane(plane)
#     expect(subject.land_plane(plane)).to eq plane
#   end
# end

describe Airport do
  it 'lets one plane take_off' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.take_off).to eq plane
  end
end

describe Airport do
  it 'raises an error if plane attempts to land if airport is full ' do
    subject.land_plane(Plane.new)
    expect { subject.land_plane Plane.new }.to raise_error "Airport full"
  end
end
