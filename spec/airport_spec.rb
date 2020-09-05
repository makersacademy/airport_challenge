require 'airport'

describe Airport do

    it {is_expected.to respond_to :takeoff}
    it {is_expected.to respond_to :land}
    it {is_expected.to respond_to :airplanes}

    it "Checks if airport is empty" do
        expect(subject.airplanes).to eq []
    end

   it "Lands a plane" do
    allow(Planes).to receive(:land).and_return(false)
   end

    it "raises an error when trying to land if the airport is full" do
        allow(subject).to receive(:bad_weather).and_return(false)     
        Airport::DEFAULT_CAPACITY.times do
            subject.land
        end
        expect {subject.land}.to raise_error "You can't land, we're full!"
    end


    it "Checks that DEFAULT_CAPACITY can be overridden." do
        heathrow = Airport.new(1000)
        expect(heathrow.capacity).to eq 1000
    end
        describe Airport do
            it "lands a plane when the weather is good" do
                allow(subject).to receive(:bad_weather).and_return(false)
                subject.land
            end
            
            it "Checks that planes won't land when the weather is bad" do
                
                allow(subject).to receive(:bad_weather).and_return(true)
            
            expect {subject.land}.to raise_error "Crap weather! Don't land!"
            end
            it "Checks that planes won't takeoff when the weather is bad" do
            allow(subject).to receive(:bad_weather).and_return(false)
            subject.land
            allow(subject).to receive(:bad_weather).and_return(true)
            expect {subject.takeoff}.to raise_error "Crap weather! Don't take off!"
            end
        end
end
