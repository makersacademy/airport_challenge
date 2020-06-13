require 'plane'

describe Plane do

  describe '#land' do
		
    it "should land at an airport" do
      expect(subject).to respond_to(:land).with(1).argument
		end
		
		it "should be at the airport after landing" do
			airport = Airport.new
			landed_plane = subject.land(airport)
			expect(landed_plane.location).to eql(airport)
		end

		context "plane landed" do
			it "should not be able to land if already landed" do
				airport = Airport.new
				landed_plane = subject.land(airport)
				expect{ landed_plane.land(airport) }.to raise_error(StandardError, "plane has already landed")
			end	
		end

		context "stormy" do
			it "should raise an error" do
				weather = double()
				allow(weather).to receive(:random_weather).and_return("stormy") #weather can pretend to be an object and will receive the method random_weather and return the value "stormy"
				airport = Airport.new
				expect { subject.land(airport, weather)}.to raise_error(StandardError, "it is too stormy to land")
			end
		end
		
  end
	
  describe '#take_off' do

    it "should take off from airport" do
      expect(subject).to respond_to(:take_off)
    end

		it "should no longer be at the airport after takeoff" do
			airport = Airport.new
			plane = subject.land(airport)
			plane.take_off(airport)
			expect(plane.location).to eql("in the air")
		end

		context "in the air" do
			it "raise an error" do
				airport = Airport.new
				plane = subject.land(airport)
				plane.take_off(airport)
				expect { plane.take_off(airport) }.to raise_error(StandardError, "plane has already taken off")
			end
		end

		context "landed at airport1" do
			it "should not be able to take off from airport2" do
				airport1 = Airport.new
				airport2 = Airport.new
				plane = subject.land(airport1)
				expect { plane.take_off(airport2)}.to raise_error(StandardError, "plane is at a different airport")
			end
		end

		context "stormy" do
			it "should not be able to #takeoff" do
				weather = double()
				allow(weather).to receive(:random_weather).and_return("stormy") #weather can pretend to be an object and will receive the method random_weather and return the value "stormy"
				airport = Airport.new
				plane = subject.land(airport)
				expect { plane.take_off(airport, weather)}.to raise_error(StandardError, "the weather, it is a stormy")
			end
		end

  end
end