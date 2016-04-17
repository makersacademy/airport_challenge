require 'weather'

describe Weather do
	it {is_expected.to respond_to :stormy?}
	
	it 'true or false' do
		expect([true,false]).to include subject.stormy?
	end
end