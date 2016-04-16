require 'weather'

describe Weather do

	it '#stormy? should return true or false' do
		expect([true,false]).to include subject.stormy?
	end
	
end