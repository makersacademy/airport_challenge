require 'plane'

describe Plane do
	describe '#land' do 
		it {is_expected.to respond_to :landed }
	end
	describe '#takeoff' do
		it {is_expected.to respond_to :takeoff }
	end
end