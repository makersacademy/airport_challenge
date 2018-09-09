require "airport.rb"
describe Airport do
    it { is_expected.to respond_to :weather }
    it { is_expected.to respond_to :planes }
    it { is_expected.to respond_to :capacity}
    it { is_expected.to respond_to(:land_plane).with(1).argument }
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it "is initialized with a default capacity" do
        expect(subject.capacity).to eq(described_class::DEFAULT_CAPACITY)
    end
    it "can be initialized with a specified capacity" do
        heathrow = Airport.new(capacity: 50)
        expect(heathrow.capacity).to eq(50)
    end
    
    describe "#land_plane" do
        before(:each) do
            subject.weather = :clear
        end
        it "returns 'Plane landed!'" do
            plane = instance_double("Plane", :id => "1234")
            expect(subject.land_plane(plane)).to eq("Plane #{plane.id} has landed!")
        end

        it "adds a landed plane to the Airport's list of planes" do
            plane = instance_double("Plane", :id => "1234")
            subject.land_plane(plane)
            expect(subject.planes).to include(plane)
        end
        it "raises an error when trying to land plane that already is at the airport" do
            plane = instance_double("Plane", :id => "1234")
            subject.land_plane(plane)
            expect{subject.land_plane(plane)}.to raise_error "Error, plane #{plane.id} is already at this Airport"
        end
        it "raises an error when trying to land plane at an airport with stormy weather" do
            plane = instance_double("Plane", :id => "1234")
            subject.weather = :stormy
            expect{subject.land_plane(plane)}.to raise_error "Error, too stormy to land plane #{plane.id}"
        end
    end

    describe "#take_off" do
        before(:each) do
            subject.weather = :clear
        end
        it "returns 'Plane taken off!' when a plane at the airport successfully takes off" do
            plane = instance_double("Plane", :id => "1234")
            subject.land_plane(plane)
            expect(subject.take_off(plane)).to eq("Plane #{plane.id} has taken off!")
        end
        it "removes plane from the list of planes" do
            plane = instance_double("Plane", :id => "1234")
            second_plane = instance_double("Plane", :id => "9393")
            subject.land_plane(plane)
            subject.land_plane(second_plane)
            subject.take_off(second_plane)
            expect(subject.planes).to eq([plane])
        end
        it "raises error when taking off plane that isnt at the airport" do
            plane = instance_double("Plane", :id => "1234")
            expect{subject.take_off(plane)}.to raise_error "Error, plane #{plane.id} is not at this airport"
        end

        it "raises error if plane is taking off from an airport with stormy weather" do
            plane = instance_double("Plane", :id => "1234")
            subject.land_plane(plane)
            subject.weather = :stormy
            expect{subject.take_off(plane)}.to raise_error "Error, too stormy to take off"
        end
        it "raises error when airport is full" do
            described_class::DEFAULT_CAPACITY.times{subject.land_plane(Plane.new)}
            expect{subject.land_plane(Plane.new)}.to raise_error "Error, Airport is full"
        end
    end
end