require 'airport'

describe Airport do
  it 'reponds to land_plane' do
    expect(subject).to respond_to :land_plane
  end

  it 'responds to take_off_plane' do
    expect(subject).to respond_to :take_off_plane
  end
end