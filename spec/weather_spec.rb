require 'weather'

describe Weather do
	
	it 'generates random weather patterns' do
		outlook = [:fine, :fine, :fine, :storm]
		expect(subject.random(outlook)).to eq :fine
	end
end