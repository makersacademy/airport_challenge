require 'airport'

describe Airport do 
	let(:plane) { double :plane }
	let(:weather) { double :weather}

	context "On initialise" do
        context "when a capacity is specified" do
            it "uses that capacity" do
                airport = Airport.new(100)
      			expect(airport.capacity).to eq(100)
            end
        end
        context "When a capacity is not specified" do
            it "it uses DEFAULT_CAPACITY" do
             	airport = Airport.new
      			expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
            end
        end
    end

	context "When landing it" do	
		it "instructs a plane to land" do
			allow(weather).to receive(:stormy?).and_return false
			allow(plane).to receive(:has_landed)
			allow(plane).to receive(:is_flying?).and_return true
			subject.land(plane)
			expect(subject.send(:planes)).to eq [plane]
		end
		it "prevents a plane landing when its not flying" do
			allow(weather).to receive(:stormy?).and_return false
			allow(plane).to receive(:has_landed)
			allow(plane).to receive(:is_flying?).and_return false
			expect{subject.land(plane)}.to raise_error "Plane is not flying"
		end
		it "prevents a plane landing when the airport is full" do
			allow(weather).to receive(:stormy?).and_return false
			allow(plane).to receive(:has_landed)
			allow(plane).to receive(:is_flying?).and_return true
			Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
			expect{subject.land(plane)}.to raise_error "Airport is full"
		end
		it "prevents a plane landing when the weather is stormy" do
			allow(weather).to receive(:stormy?).and_return true
			allow(plane).to receive(:has_landed)
			allow(plane).to receive(:is_flying?).and_return true
			expect{subject.land(plane)}.to raise_error "Too stormy to land"
		end
	end

	
	context "When taking-off it" do
		it "instructs a plane to take_off only if its in the airport" do
			allow(weather).to receive(:stormy?).and_return false
			allow(plane).to receive(:is_flying?).and_return true
			allow(plane).to receive(:has_landed)	
			subject.land(plane)
			allow(plane).to receive(:is_flying?).and_return false
			allow(plane).to receive(:has_taken_off)
			subject.take_off(plane)
			expect(subject.send(:planes)).to eq []
		end
		it "prevents a plane taking-off when the weather is stormy" do
			allow(weather).to receive(:stormy?).and_return true
			allow(plane).to receive(:is_flying?).and_return false
			allow(plane).to receive(:has_taken_off)
			expect(subject.take_off(plane)).to raise_error "Too stormy to take off"
		end
		it "prevents a plane taking-off when its flying" do
			allow(weather).to receive(:stormy?).and_return false
			allow(plane).to receive(:is_flying?).and_return true
			allow(plane).to receive(:has_taken_off)
			expect{subject.take_off(plane)}.to raise_error "Plane is currently flying" 
		end
	end
end
