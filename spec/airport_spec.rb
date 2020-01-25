require 'airport'

describe Airport do 
    it 'should instruct plane to land' do 
        expect(Airport.new.land).to eq 'land'
    end 
end 