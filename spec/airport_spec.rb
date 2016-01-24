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
			airport = Airport.new
			plane = double(:plane)	
			airport.land(plane)
			airport.takeoff plane
			expect(airport.planes).to eq []
		end
	end
end

# describe Airport do 
# 	describe '#land' do 
# 		it 'give permission to land' do 

describe Airport do
	describe'takeoff' do 
	it {is_expected.to respond_to :takeoff}
	end
end

describe Airport do
    it { is_expected.to respond_to(:takeoff).with(1).argument }
end

# describe Airport do 
# 	describe '#takeoff' do 
# 		it 'it allow takes off the plane only if the plane is actually in the airport' do 
# 			airport = Airport.new
# 			plane = double(:plane)	
# 			airport.land(plane)
# 			expect(airport.takeoff(plane)).to eq 'Plane taking off..'
# 		end
# 	end
# end
describe Airport do
		#it 'it will generate a random number, whe the number is between 7 and 10 i will not let land or take off' do
		it {is_expected.to respond_to :'stormgenerator'}
end



 describe Airport do 
     describe 'initialize' do 
         subject { Airport.new } 
             let(:plane) { double(:helloo) }
             it 'it will let the user to set the capacity of the airport, or leave the default one' do 
                 described_class::DEFAULT_CAPACITY.times do 
                 subject.land(plane)
             end
         end
     end
end

describe Airport do  
    describe '#land' do 
        it 'raises an error when the airport is full' do
           subject.capacity.times {subject.land "plane"}
           expect {subject.land double(:plane)}.to raise_error 'Airport full, Permission Denied' 
        end
    end
end