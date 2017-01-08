require 'plane'

describe Plane do

  context "when class is initialized it should have certain status" do
    it 'status is true by default' do
      plane = Plane.new
      expect(plane.status).to eq("landed")
    end
    it 'assigns a status of "flying"' do
      plane = Plane.new("flying")
      expect(plane.status).to eq("flying")
    end
    it 'status is true ' do
      plane = Plane.new("landed")
      expect(plane.status).to eq("landed")
    end

  end


end
