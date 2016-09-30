
require 'spec_helper'
require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to :land_plane}

  #describe "instructs a plane to land" do
  # plane = Plane.new
  # expect(subject.land(plane)).to eq plane
  #end

end
