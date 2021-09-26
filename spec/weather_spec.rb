require 'weather'

describe Weather do

    it 'If weather is bad' do
        weather = Weather.new
        allow(weather).to receive(:bad?).and_return true 
        expect(weather.bad?).to eq(true)
    end

    it 'If weather is good' do
        weather = Weather.new
        allow(weather).to receive(:bad?).and_return false
        expect(weather.bad?).to eq(false)
    end

    it 'If weather.bad? is boolean' do
        weather = Weather.new
        expect([true, false]).to include(weather.bad?)
    end





end