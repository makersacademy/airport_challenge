require 'weather'

describe Weather do

    let(:airport) { Airport.new { include Weather } }

    it 'lets an airport get the weather' do 
        expect(airport).to respond_to(:get_weather)
    end 

    it 'returns Stormy' do
        expect(airport.get_weather).to eq "Stormy"
    end



    # it 'generates a random number between 1 and 3' do 
    #     expect(subject.generate_number).to be_between(1, 3).inclusive
    # end 


end 