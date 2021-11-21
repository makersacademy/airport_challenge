require 'weather'

describe Weather do

    it {is_expected.to respond_to(:generate_number) }

    it 'generates a random number between 1 and 3' do 
        expect(subject.generate_number).to be_between(1, 3).inclusive
    end 

end 