require 'plane.rb'

describe Plane do 

    let(:plane) { Plane.new }

    describe '#fly' do
    it 'shows the plane is flying' do 
        expect(plane.fly).to eq true
    end
    end
end
