require 'airport'

describe Airport do 
    #this line is to first test to see if responds:
    #it { is_expected.to respond_to (:land).wit(1).argument }
    it 'instructs a plane to land' do
        expect(subject).to respond_to(:land).with(1).argument
    end 

    it 'instructs a plane to take off' do 
        expect(subject).to respond_to(:take_off).with(1).argument 
    end 

    it 'does not allow landind when full' do 
        10.times do 
            airport.land(:plane)
        end 
        expect { airport.land(:plane)}.to raise_error 'Cannot land plane: airport full'
    end 
end 
