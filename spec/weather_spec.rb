require 'weather'

describe Weather do
	it {is_expected.to respond_to(:stormy?)}

	it 'is expected to return true or false' do
	weather = double(:weather)
	allow(weather).to receive(:stormy?) {true}
	expect(weather.stormy?).to eq(true)
  end
end