require 'airport'

describe Airport do

  it { is_expected.to be_instance_of(Airport) }

  it 'can instruct a plane to land there' do
    testplane = Plane.new
    subject.land_plane(testplane)
    expect(subject.planes).to eq(testplane)
  end

  it 'can instruct a plane to take off from there' do
    testplane = Plane.new
    subject.take_off_plane(testplane)
    expect(subject.planes).not_to include(testplane)
  end

end
