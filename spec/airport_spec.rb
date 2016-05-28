require 'airport'

describe Airport do

  it 'responds to dock' do
    expect(subject).to respond_to(:dock)
  end

  it 'responds to dock and a argument plane' do
    expect(subject).to respond_to(:dock).with(1).arguments
  end

  it 'responds to land a plane' do
    expect(subject).to respond_to :land_plane
  end

  it 'responds to take off a palne' do
    expect(subject).to respond_to :take_off_plane
  end

end
