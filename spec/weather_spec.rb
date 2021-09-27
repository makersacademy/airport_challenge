require 'weather'

describe Weather do
let(:weather) {Weather.new}

    it 'If weather is bad' do
        allow(weather).to receive(:bad?).and_return true 
        expect(weather.bad?).to eq(true)
    end

    it 'If weather is good' do
        allow(weather).to receive(:bad?).and_return false
        expect(weather.bad?).to eq(false)
    end

    it 'If weather.bad? is boolean' do
        expect([true, false]).to include(weather.bad?)
    end

end