require 'plane'

describe Plane do
  describe '#land' do
    it "should land at an aiport" do
      expect(subject).to respond_to(:land).with(1).argument
		end
		
		it "should be at the airport after landing" do
			airport = Airport.new
			landed_plane = subject.land(airport)
			expect(landed_plane.location).to eql(airport)
		end
	end
	
	describe '#take_off' do
		it "should take off from airport" do
			expect(subject).to respond_to(:take_off)
		end

		it "should no longer be at the airport after takeoff" do
			airport = Airport.new
			plane = subject.land(airport)
			plane.take_off
			expect(plane.location).to eql("in the air")
		end
	end
end
