require 'airport'

describe Airport do
  it 'responds to #land_plane' do
    expect(subject).to respond_to :land_plane
  end
  it 'confirms that a plane had landed' do
    plane = subject.land_plane
    expect(plane.landed?).to eq true
  end
  it 'instructs a plane to #take_off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end
end
