require 'airport'
require 'plane'
describe Airport do
describe 'capacity' do
  it 'can be overridden on initialize' do
    random_capacity = Random.rand(100)
    subject = described_class.new random_capacity
    expect(subject.capacity).to eq random_capacity
  end
  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq Airport::AIRPORT_CAPACITY
  end
end
it "ensures that flying planes can't take of or be in airport" do
  plane = Plane.new
  allow(Weather).to receive(:stormy).and_return(false)
  subject.land_plane(plane)
  subject.depart_plane(plane)
  expect{subject.depart_plane(plane)}.to raise_error('already landed')
end
it "ensures that landed planes can't land again" do
  plane = Plane.new
  allow(Weather).to receive(:stormy).and_return(false)
  subject.land_plane(plane)
  expect{subject.land_plane(plane)}.to raise_error RuntimeError
end
describe '#land_plane' do
  it 'instructs a plane to land' do
    plane = Plane.new
    allow(Weather).to receive(:stormy).and_return(false)
    subject.land_plane(plane)
    expect(subject.planes).not_to be_empty
  end
  it 'confirms that plane has landed' do
    plane = Plane.new
    allow(Weather).to receive(:stormy).and_return(false)
    subject.land_plane(plane)
    expect(subject.planes).to include plane
  end
  it 'prevents landing if weather is stormy' do
    plane = Plane.new
    allow(Weather).to receive(:stormy).and_return(true)
    expect{subject.land_plane(plane)}.to raise_error('weather conditions prvent landing')
  end
  it 'prevents landing if airport is full' do
    allow(Weather).to receive(:stormy).and_return(false)
    subject.capacity.times { subject.land_plane Plane.new }
    expect {subject.land_plane Plane.new}.to raise_error('airport is full')
  end
end
describe '#depart_plane' do
  it 'prevents departure if weather is stormy' do
    plane = double('plane', :departed => false)
    allow(Weather).to receive(:stormy).and_return(true)
    expect{subject.depart_plane(plane)}.to raise_error('weather conditions prvent take-off')
  end
  it 'instructs a plane to depart' do
    plane = Plane.new
    allow(Weather).to receive(:stormy).and_return(false)
    subject.land_plane(plane)
    subject.depart_plane(plane)
    expect(subject).to be_empty
  end
  it 'confirms that plane departured' do
    plane = Plane.new
    allow(Weather).to receive(:stormy).and_return(false)
    subject.land_plane(plane)
    subject.depart_plane(plane)
    expect(subject.planes).not_to include plane
  end
end
end
