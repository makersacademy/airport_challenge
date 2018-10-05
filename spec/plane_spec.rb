require "plane"

describe Plane do
  describe 'plane status check' do
    it "responds to status?" do
      expect(subject).to respond_to :status?
    end

    it 'gets plane status' do
      plane = Plane.new
      expect(plane.status?).to eq ("air")
    end
  end

  describe 'plane set status' do
    it "responds to set_status" do
      expect(subject).to respond_to :set_status
    end

    it 'sets plane status' do
      plane = Plane.new
      expect(plane.set_status("land")).to eq ("land")
    end
  end
end
