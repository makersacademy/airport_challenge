require "airport"
require "plane"

describe Airport do
	
	subject(:airport) { described_class.new }
	let (:plane) {double(:plane)}
		
		it "The plane lands in the airport" do
			expect(subject.land(plane)).to be true
		end

		it "The plane departs from the airport" do
			expect(subject.depart(plane)).to be true
		end
end