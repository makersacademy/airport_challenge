require 'airport'

describe Airport do
  it 'responds to land' do
    expect(subject).to respond_to :land_plane
  end
  it 'confirms that the plane had landed' do
    plane = subject.land_plane
    expect(plane.landed?).to eq true
  end
end
