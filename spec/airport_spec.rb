require 'airport'

describe Airport do 

    before(:each) do
        @airport = Airport.new
        @plane = Plane.new
    end

    it 'responds to .land' do
        expect(subject).to respond_to :land
    end

    it 'prints a confirmation message when a plane lands' do
        expect { @airport.land @plane }.to output("Plane landed!\n").to_stdout
    end
end