require './lib/plane.rb'

RSpec.describe Plane do 
    it 'is a new plane' do
        plane = Plane.new

        expect (subject).to eq(plane)
    end
end