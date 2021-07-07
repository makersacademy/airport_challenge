require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'
describe Weather do
	let (:weather) { Weather.new }
	it 'will always return stormy' do
		allow(subject).to receive(:stormy?).and_return(true)
		expect(subject.stormy?).to eq(true)
	end

	it 'will always return not stormy' do
		allow(subject).to receive(:stormy?).and_return(false)
		expect(subject.stormy?).to eq(false)
	end
end