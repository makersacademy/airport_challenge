require 'weather'

describe Weather do

	it {is_expected.to respond_to :sunny?}

	it 'checks if it is sunny' do
		expect(Weather.new).to be_sunny
	end
end