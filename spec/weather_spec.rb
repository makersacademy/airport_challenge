require 'weather'

describe Weather do

	let(:airport) { (Class.new {include Weather}).new }
	
	it 'expects stormy? to be true when given random number 0' do
		srand(2) # seed means next call to rand will return 0
		expect(airport.stormy?).to eq true
	end
	
	it 'expects stormy? to be false when given random number 3' do
		srand(1) #seed means next call to rand will return 3
		expect(airport.stormy?).to eq false
	end

end