require 'weather'
describe Weather do
    let(:weather) { Weather.new }
    it '.query' do
        expect(weather.query).to eq(:sunny)
    end
end