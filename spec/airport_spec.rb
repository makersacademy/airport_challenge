require 'airport'

describe Airport do

	describe "#initialize" do
		it "has a default capacity" do
			expect(subject.instance_variable_get(:@capacity)).to eq(Airport::DEFAULT_CAPACITY)
		end
	end

	describe "#accept_plane?(plane)" do
		it "returns true if empty" do
			plane = double(:plane)
			expect(subject.accept_plane?(plane)).to be(true)
		end
		it "raise an error if full" do
			test_capacity = rand(1..100)
			planes = []
			airport = Airport.new(test_capacity)
			test_capacity.times { |i|
				planes[i] = double(:plane)
				airport.accept_plane?(planes[i])
			}
			expect{airport.accept_plane?(double(:plane))}.to raise_error
		end
	end

	describe "#is_airport?" do
		it "returns true" do
			expect(subject.is_airport?).to be(true)
		end

	end

end