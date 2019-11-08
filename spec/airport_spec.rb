require 'airport'
require './lib/plane.rb'

describe Airport do

  let(:testplane) { double :Plane }

  it { is_expected.to be_instance_of(Airport) }

  it 'can instruct a plane to land' do
    subject.land_plane(testplane)
    expect(subject.planes).to include(testplane)
  end

  it 'can instruct a plane to take off' do
    subject.planes << testplane
    subject.take_off_plane(testplane)
    expect(subject.planes).not_to include(testplane)
  end



end
