require "airport"
require "plane"
require "weather"

describe Airport do
	
	subject(:airport) { described_class.new }
	let (:plane) {double(:plane)}
	let (:weather) {double(:weather, random_outlook: :stormy)}
		
		it "The plane lands in the airport" do
			expect(subject.land(plane)).to be true
		end

		it "The plane departs from the airport" do
			expect(subject.depart(plane)).to be true
		end

		it "The plane can not depart due storm" do
			expect {subject.depart(plane).to raise_error "Unable to take off due to stormy weather"}
		end
end