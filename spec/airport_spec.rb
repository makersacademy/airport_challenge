require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to :land_plane }
  it 'lands a plane' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes).to eq([plane])
  end

  it 'raises an error when the airport is full' do
    10.times { subject.land_plane(Plane.new) }
    expect {subject.land_plane(Plane.new)}.to raise_error('The airport is full')
  end


  it { is_expected.to respond_to :takeoff_plane }
  it 'takes off a plane and shows airport as empty' do
    plane = Plane.new
    subject.land_plane(plane)
    subject.takeoff_plane
    expect(subject.planes).to be_empty
  end

end