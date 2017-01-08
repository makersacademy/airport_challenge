require 'plane'

describe Plane do

  context "when class is initialized it should have certain status" do
    it 'status is true by default' do
      plane = Plane.new
      expect(plane.status).to eq(true)
    end
    it 'assigns a status of "true"' do
      plane = Plane.new(true)
      expect(plane.status).to eq(true)
    end
    it 'status is true ' do
      plane = Plane.new(false)
      expect(plane.status).to eq(false)
    end

  end


end
