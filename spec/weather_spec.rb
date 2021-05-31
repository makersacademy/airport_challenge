require 'weather'

RSpec.describe Weather do

    it 'returns "clear"' do
        weather = subject
        allow(weather).to receive(:ok?) {'clear'}
        expect(subject.ok?).to eq('clear')
    end

    it 'returns "stormy"' do
        weather = subject
        allow(weather).to receive(:ok?) {'stormy'}
        expect(subject.ok?).to eq('stormy') 
    end
   
end