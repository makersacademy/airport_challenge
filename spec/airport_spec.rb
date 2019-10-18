require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
    it 'creates an instance of the airport class' do
        expect(subject).to be_a(Airport)
    end

    it 'should have an empty array of planes' do
        expect(subject.planes_arr).to be_empty
    end
end