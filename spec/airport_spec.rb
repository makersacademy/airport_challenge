require 'airport'

describe Airport do 
	let(:plane) { double :plane }
	let(:weather) { double :weather}
	subject(:airport) { described_class.new }
	subject(:airport1) { described_class.new(100) }

	context "On initialise" do
        context "when a capacity is specified" do
            it "uses that capacity" do
      			expect(airport1.capacity).to eq(100)
            end
        end
        context "When a capacity is not specified" do
            it "it uses DEFAULT_CAPACITY" do
      			expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
            end
        end
    end

    before(:each) do
		    allow(subject).to receive(:stormy_weather?).and_return(false)
			allow(plane).to receive(:is_flying?).and_return true
		end

	context "When landing it" do

		before(:each) do
			allow(plane).to receive(:has_landed)
		end	

		it "instructs a plane to land" do
			subject.land(plane)
			expect(subject.send(:planes)).to eq [plane]
		end
		it "prevents a plane landing when its not flying" do
			allow(plane).to receive(:is_flying?).and_return false
			expect{subject.land(plane)}.to raise_error "Plane is not flying"
		end
		it "prevents a plane landing when the airport is full" do
			allow(subject).to receive(:full?).and_return(true)
			expect{subject.land(plane)}.to raise_error "Airport is full"
		end
		it "prevents a plane landing when the weather is stormy" do
			allow(subject).to receive(:stormy_weather?).and_return(true)
			expect{subject.land(plane)}.to raise_error "Too stormy to land"
		end
	end

	
	context "When taking-off it" do

		before(:each) do
			allow(plane).to receive(:has_taken_off)
		end	

		it "instructs a plane to take_off only if its in the airport" do
			allow(plane).to receive(:has_landed)	
			subject.land(plane)
			allow(plane).to receive(:is_flying?).and_return false
			allow(plane).to receive(:has_taken_off)
			subject.take_off(plane)
			expect(subject.send(:planes)).to eq []
		end
		it "prevents a plane taking-off when the weather is stormy" do
			allow(subject).to receive(:stormy_weather?).and_return(true)
			allow(plane).to receive(:is_flying?).and_return false
			expect{subject.take_off(plane)}.to raise_error "Too stormy to take off"
		end
		it "prevents a plane taking-off when its flying" do
			expect{subject.take_off(plane)}.to raise_error "Plane is currently flying" 
		end
	end
end
