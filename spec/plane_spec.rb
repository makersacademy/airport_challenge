require 'plane'

describe Plane do

  it '#land_plane' do
    subject.land_plane
    expect(subject).to be_landed
  end

  it '#take_off' do
    subject.take_off
    expect(subject).not_to be_landed
  end
end
