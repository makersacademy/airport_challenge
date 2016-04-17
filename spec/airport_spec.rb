require "airport"
require "plane"

describe Airport do
	
	let (:plane) {double(:plane)}
	subject(:airport) { described_class.new }
		
		it "The plane lands in the airport" do
			expect(subject.land(plane)).to be true
		end

		it "The plane departs from the airport" do
			expect(subject.depart(plane)).to be true
		end
end