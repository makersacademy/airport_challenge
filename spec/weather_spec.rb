require 'weather'

describe Weather do
    it 'checks if weather exists' do
        expect(subject).to be_a Weather
    end

    it { is_expected.to respond_to :stormy? }

    it 'checks if weather equals stormy' do 
        expect(subject.stormy?).to eq true
    end

    it 'checks if weather is sunny' do 
        expect(subject.stormy?).to eq false
    end 

end 


#  I want to prevent takeoff when weather is stormy 

