require './lib/airport'
require './lib/weather'

describe Airport do
    it "lands a plane" do
        expect(subject.land(Plane.new)).to eq "Plane landed"
    end

    it "plane took off" do
        expect(subject.take_off).to eq "Plane no longer in the airport"
    end

    it "not allowed landing, airport full" do
        Airport::AIRPORT_MAX_CAP.times { subject.land(Plane.new) }
        expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end

    
end

