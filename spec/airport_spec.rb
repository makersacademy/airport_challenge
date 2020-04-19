require 'airport'

describe Airport do 
    #this line is to first test to see if responds:
    #it { is_expected.to respond_to (:land).wit(1).argument }
    it 'instructs a plane to land' do
        expect(subject).to respond_to(:land).with(1).argument
    end 
end 
