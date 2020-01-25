require 'weather'

describe Weather do
    it 'checks if weather exists' do
        expect(subject).to be_a Weather
    end

    it 'checks if weather is stormy' do
        expect(subject).to respond_to :stormy?
    end
end 


#  I want to prevent takeoff when weather is stormy 

