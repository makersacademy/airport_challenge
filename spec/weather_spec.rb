require 'weather'

describe Weather do
	describe '#class methods' do
		it { is_expected.to(respond_to(:weather?)) }
	end

	describe 'weather?' do
		it 'NOT IMPLEMENTED: weather? will return one of: "sunny" or "stormy"' do
			#don't actually know how to test this!
		end
	end
end