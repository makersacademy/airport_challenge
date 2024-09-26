require('weather')

describe 'Weather' do
    it 'allows a weather variable to be created' do
        expect(Weather.new).to be_an_instance_of(Weather)
    end
end