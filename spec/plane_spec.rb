require "plane"

describe Plane do
  describe 'plane status check' do

    it 'gets plane status - checks default = land' do
      plane = Plane.new
      expect(plane.status?).to eq "land"
    end

    it 'gets plane status of manually located plane' do
      plane = Plane.new("air")
      expect(plane.status?).to eq "air"
    end
  end

  describe 'plane update status' do

    it 'sets plane status - air to land' do
      plane = Plane.new("air")
      expect(plane.update_status("land")).to eq "land"
    end
  end
end
