require "plane"

describe Plane do
  describe 'plane status check' do
    it "responds to status?" do
      expect(subject).to respond_to :status?
    end

    it 'gets plane status' do
      plane = Plane.new
      expect(plane.status?).to eq "air"
    end
  end

  describe 'plane update status' do
    it "responds to update_status" do
      expect(subject).to respond_to :update_status
    end

    it 'sets plane status' do
      plane = Plane.new
      expect(plane.update_status("land")).to eq "land"
    end
  end
end
