require 'airport'

describe Airport do
  it {is_expected.to respond_to :land_plane}

  it 'confirms landed plane' do
    plane = subject.land_plane
    expect(plane).to be_landed
  end
end
