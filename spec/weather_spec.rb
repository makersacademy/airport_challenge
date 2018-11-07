require 'weather'
describe Weather do
	# Funtions to know how is the weather to prevent to land and take off the aircraft
	context 'Is necessary to know if is stormy' do
		it 'We need to receive a true value from this test' do
			weather = Weather.new
			expect(weather.stormy?).to be(true).or be(false)
		end
	end
end