require 'spec_helper'
require 'weather'

describe Weather do
	subject(:weather) { described_class.new }

	it 'indicates whether or not the weather is stormy' do
		weather = Weather.new
		expect(weather.stormy?).to eq false
	end
end