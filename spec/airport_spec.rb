# This spec tests the airport in airport.rb
require 'airport'

describe Airport do

  describe '#Landing procedures' do
    it 'gets plane when plane lands' do
      plane = Plane.new
      expect(subject.instruct_landing(plane)).to eq plane
    end

  end

  it 'expects plane to takeoff and leave the airport' do
    plane = Plane.new
    expect(subject.instruct_takeoff(plane)).to eq plane
  end



end
