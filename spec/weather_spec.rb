require 'weather'

describe Weather do

	let(:weather) {double :weather, sunny?: true}

	it {is_expected.to respond_to :sunny?}

	it 'checks if it is sunny' do
		expect(weather).to be_sunny
	end

	
end