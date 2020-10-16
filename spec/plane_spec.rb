require "plane"

describe Plane do
	describe "#weather_ok?" do
		it "can respond to the method" do
			expect(subject).to respond_to(:weather_ok?)
		end
	end
end
