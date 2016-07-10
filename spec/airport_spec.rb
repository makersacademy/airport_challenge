require 'airport'

describe Airport do 
	describe '#class methods' do
		it { is_expected.to(respond_to(:land_plane)) }
	end
	
end