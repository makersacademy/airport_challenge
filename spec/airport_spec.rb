require 'airport'

describe Airport do
  it 'allows planes to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it 'lands at the airport' do
    plane = subject.new_plane
    expect(subject.land(plane)).to eq(plane)
  end
  it 'checks the plane is in the airport' do
    plane = subject.new_plane
    subject.land(plane)
    expect(subject.plane).to eq(plane)
  end
  it 'stores planes at the airport' do
    expect(subject.parking).to be_kind_of(Array)
  end
  it 'allows planes to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

end
