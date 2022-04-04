require 'weather'

describe Weather do
    describe 'storm blocks landing' do
        allow(weather).to receive(:stormy?).and_return true
        message = 'Unable to land due to bad weather'
        expect {airport.land(plane)}.to raise_error message
    end 

    describe 'a plane can land after storm has cleared' do
        allow(weather).to receive(:stormy?).and_return false
        expect { airport.land(plane)}.not_to raise_error
    end 
end 