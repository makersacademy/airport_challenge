require 'airport'
require './lib/plane.rb'

describe Airport do

  it { is_expected.to be_instance_of(Airport) }

  it 'can instruct a plane to land' do
    testplane = Plane.new
    subject.land_plane(testplane)
    expect(subject.planes).to include(testplane)
  end

  it 'can instruct a plane to take off' do
    testplane = Plane.new
    subject.planes << testplane
    subject.take_off_plane(testplane)
    expect(subject.planes).not_to include(testplane)
  end

end
