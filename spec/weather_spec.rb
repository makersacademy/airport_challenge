require 'weather'

RSpec.describe Weather do
	describe 'initialize' do
		it 'sets weather conditions as constants' do
			today = Weather.new
			expect(today).to eq today
		end

		it 'chooses a random sample from weather list' do
			expect(subject.random_outlooks("Sunny")).to eq "Sunny"
		end
	end
end