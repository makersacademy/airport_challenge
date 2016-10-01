require 'airport'

describe Airport do
	it { is_expected.to have_attributes(landed_planes: []) }
	
end

# Possible Code
# ------------
# let(:plane) { double(:plane, :landed? => true ) }
	# before(:each) { @airport = Airport.new}

	# describe '#landed_planes' do
	# 	it 'records landed planes' do
			
	# 	end
	# end