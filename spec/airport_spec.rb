require 'airport'

describe Airport do 
	let(:plane) { double :plane }

	context "on initialise" do
        context "when a capacity is specified" do
            it "uses that capacity" do
                airport = Airport.new(100)
      			expect(airport.capacity).to eq(100)
            end
        end
        context "when a capacity is not specified" do
            it "it uses DEFAULT_CAPACITY" do
             	airport = Airport.new
      			expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
            end
        end
        it "an array is created to hold planes" do
        	airport = Airport.new
        	expect(airport.planes).to eq []
        end
    end

	it {is_expected.to respond_to(:land).with(1)}

	context "when landing it" do
		it "instructs a plane to land" do
			subject.land(plane)
			expect(subject.planes).to eq [plane]
		end
		it "prevents a plane landing when the airport is full" do
			Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
			expect {subject.land(plane)}.to raise_error("Airport is full")
		end
	end

	it {is_expected.to respond_to(:take_off).with(1)}

	it "instructs a plane to take_off" do
		subject.take_off(plane)
		expect(subject.planes).to eq []
	end
	

end
