require 'plane'

describe Plane do
	describe '#fly' do 
		it {is_expected.to respond_to :fly }
	end
	describe '#landed' do
		it {is_expected.to respond_to :landed }
	end
end