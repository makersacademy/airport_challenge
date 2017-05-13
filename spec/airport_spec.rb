require 'airport'

describe Airport do
  it 'responds to instruct_to_land method' do
    expect(subject).to respond_to(:instruct_to_land).with(1).argument
  end
  it 'responds to landed_planes method' do
    expect(subject).to respond_to(:landed_planes)
  end
  it 'should should return array if land_planes method is called on it' do
    expect(subject.landed_planes.class).to eq Array
  end
end
