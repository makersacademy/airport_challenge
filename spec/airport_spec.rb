require "airport"

describe Airport do
	
	it { should respond_to(:land)}

	it "landed a/c can be store" do
		expect(subject.land).to eq [1]
	end

	it "landed a/c can be store" do
		3.times{subject.land}
		expect(subject.aircrafts.count).to eq 3
	end

	it "took off a/c will be gone" do
		subject.land
		subject.take_off
		expect(subject.aircrafts).to eq []
	end

	specify { expect(subject.capacity).to eq(10) }

	it "airport is full when reach capacity" do
		Airport::DEFAULT.times{subject.land}
		expect(subject.full?).to eq true
	end

	it "accept capacity config and return full when reach" do
		airport = Airport.new(3)
		3.times{airport.land}
		expect(airport.full?).to eq true
	end

	it "raise error if land a/c when airporti is full" do
		airport = Airport.new(3)
		expect{4.times{airport.land}}.to raise_error "airport is full"
	end

end