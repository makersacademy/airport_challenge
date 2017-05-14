require 'weather'

describe Weather do

	let(:weather) {double :weather, sunny?: true}

	it {is_expected.to respond_to :sunny?}

	it 'checks if it is sunny' do
		expect(weather).to be_sunny
	end

	let(:weather2) {double :weather, sunny?: false}
	it 'checks if weather is stormy' do
		allow(weather2).to receive(:sunny?).and_return(false)
	end

end