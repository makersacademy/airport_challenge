require 'weather'

describe Weather do

	subject(:weather) {described_class.new}
	
	it 'is stormy' do
		expect(weather).to respond_to(:stormy?)
	end

end