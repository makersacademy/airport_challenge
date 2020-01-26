require 'weather'

describe Weather do 
    
    it 'should return either true or false to weather it is stormy' do 
        
        expect(Weather.new.stormy?).to eq(true).or eq(false)
    end 

end
