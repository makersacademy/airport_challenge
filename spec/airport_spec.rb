require 'airport'

describe Airport do
  it 'instructs a plane to land at an airport' do
    expect(subject).to respond_to :land_plane      
  end

  it 'instructs a plane to take off from an airport' do
    expect(subject).to respond_to :take_off
  end
end