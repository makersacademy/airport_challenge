# This spec tests the airport in airport.rb
require 'airport'

describe Airport do

  describe '#Landing procedures' do
    it 'adds plane to the at_airport array' do
      plane = Plane.new
      expect(subject.instruct_landing(plane)).to eq [plane]
    end

  end

  describe '#Takeoff procedures' do
    it 'expects plane to takeoff and leave the airport' do
      plane = Plane.new
      expect(subject.instruct_takeoff(plane)).to eq plane
    end

    it 'expects airport to be empty' do
      plane = Plane.new
      subject.instruct_landing(plane)
      subject.instruct_takeoff(plane)
      expect(subject.empty?).to eq true
    end
  end



end
