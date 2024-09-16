require 'weather'

describe Weather do
let(:weather) {Weather.new}
    
    it 'if bad' do
        allow(weather).to receive(:bad?).and_return true
        expect(weather.bad?).to eq(true)
    end

    it 'if good' do
        allow(weather).to receive(:bad?).and_return false
        expect(weather.bad?).to eq(false)
    end

    it 'if both true and false' do
        expect([true, false]).to include(weather.bad?)
    end
end