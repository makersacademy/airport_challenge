require 'weather'

describe Weather do
	it {is_expected.to respond_to(:stormy?)}

	# it 'is expected to return true or false' do
	# weather = Weather.new
	# expect(weather.stormy?).to eq(true,false)
 #  end
end