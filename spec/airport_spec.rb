# This spec tests the airport in airport.rb
require 'airport'

describe Airport do

  it 'gets plane when plane lands' do
    plane = Plane.new
    expect(subject.instruct_landing(plane)).to eq plane
  end



end
