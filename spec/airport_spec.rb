require 'airport'

describe Airport do
  it { expect(subject).to respond_to :release_plane }

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

end
