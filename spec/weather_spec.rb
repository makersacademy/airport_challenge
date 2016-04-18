require 'weather'

describe Weather do 
	let(:weather) {subject}
	it 'responds to stormy' do 
	expect(weather).to respond_to 'stormy?'
	end

end
