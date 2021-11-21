require 'weather'

describe Weather do
	it "creates an instance of itself" do
		current_weather = Weather.new
		expect(current_weather).to be_an_instance_of(Weather)
	end
	it "has a #stormy? predicate method" do
		expect(subject).to respond_to(:stormy?)
	end
end