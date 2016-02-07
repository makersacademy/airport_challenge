require 'airport'


describe Airport do
	it {is_expected.to respond_to :land}
end

describe Airport do
	it {is_expected.to respond_to :planes}
end


describe Airport do
	describe '#planes' do 
	it 'it will be able to read the planes in the airport' do 
		airport = Airport.new
		expect(airport.planes).to eq []
		end
	end
end


describe Airport do
    it { is_expected.to respond_to(:land).with(1).argument }
end
describe Airport do 
	describe '#land' do 
		it 'it allow takes off the plane selected and confirms the plane is not longer there' do 
			airport = described_class.new
			allow(airport).to receive(:weather?).and_return(true)
			plane = double(:plane)	
			airport.land(plane)
			airport.takeoff plane
			expect(airport.planes).to eq []
		end
	end
end

describe Airport do
    it { is_expected.to respond_to(:land).with(1).argument }
end
describe Airport do
    describe '#land' do
        it 'it demostrate that the plane actually lands' do
            airport = described_class.new
            allow(airport).to receive(:weather?).and_return(true)
            plane = double(:plane)
            airport.land(plane)
            expect(airport.planes).to eq [plane]
        end
    end
end

         	

describe Airport do
	describe'takeoff' do 
	it {is_expected.to respond_to :takeoff}
	end
end

describe Airport do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
end

describe Airport do #------------------
 	describe '#takeoff' do 
 		it 'it allow takes off the plane only if the plane is actually in the airport' do 
 			airport = described_class.new
 			allow(airport).to receive(:weather?).and_return(true)
 			expect {airport.takeoff double(:plane)}.to raise_error 'No plains in the airport'
 		end
 	end
 end





describe Airport do  
    describe '#land' do 
        it 'raises an error when the airport is full' do
        	airport = described_class.new
         	allow(airport).to receive(:weather?).and_return(true)
           airport.capacity.times {airport.land "plane"}
           expect {airport.land double(:plane)}.to raise_error 'Airport full, Permission Denied' 
        end
    end
end

 describe Airport do  
     describe '#land' do 
         it 'raises an error when the weather is stormy' do
         	airport = described_class.new
         	allow(airport).to receive(:weather?).and_return(false)
             expect {airport.land double(:plane)}.to raise_error 'The weather conditions does not allow Landing at the moment'
         end
     end
end


describe Airport do  
    describe '#takeoff' do 
        it 'raises an error when the weather is stormy' do
        	airport = described_class.new
        	allow(airport).to receive(:weather?).and_return(false)
            expect {airport.takeoff double(:plane)}.to raise_error 'The weather conditions does not allow Taking off at the moment'
        end
    end
end

