require 'airport'


describe Airport do
  it { is_expected.to respond_to :land_plane }

  it 'allows a plane to be landed' do
    plane = Plane.new
    expect {subject.land_plane(plane).to eq true }
  end
end
