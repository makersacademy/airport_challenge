require 'airport'

describe Airport do
  it 'lets an air traffic controller instruct a plane to land at an aiport' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end
end
