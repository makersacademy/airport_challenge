require 'airport'

describe Airport do
  it 'instruct a plane to land' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'instruct a plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end
