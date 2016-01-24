require 'airport'

describe Airport do
	it {is_expected.to respond_to :land}
end

# describe Airport do 
# 	describe '#land' do 
# 		it 'give permission to land' do 


# describe Airport do
#     describe 'initialize' do 
#         subject { Airport.new } 
#             let(:plane) { double(:helloo) }
#             it 'defaults capacity' do 
#                 described_class::DEFAULT_CAPACITY.times do 
#                 subject.land(plane)
#         end
#     end
# end
describe Airport do  
    describe '#land' do 
        it 'raises an error when the airport is full' do
           subject.capacity.times {subject.land "plane"}
           expect {subject.land double(:plane)}.to raise_error 'Airport full, Permission Denied' 
        end
    end
end