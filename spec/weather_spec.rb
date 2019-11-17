require 'weather'

class Place; include Weather; end

shared_examples "a place" do

	it "has a weather" do
		place = Place.new
		expect(place.stormy?.nil?).to be false
	end

end