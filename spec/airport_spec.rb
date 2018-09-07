require "airport.rb"
#when refactoring, consider using doubles for the Plane.new
describe Airport do
    it { is_expected.to respond_to :weather }
    it { is_expected.to respond_to :planes }
    it { is_expected.to respond_to(:land_plane).with(1).argument }
    it { is_expected.to respond_to :take_off }
    it { is_expected.to respond_to :capacity}
    describe "#change_weather" do
        it "changes the weather variable to whatever weather code it receives" do
            subject.change_weather("stormy")
            expect(subject.weather).to eq(:stormy)
        end
    end

    describe "#land_plane" do
        it "returns 'Plane landed!'" do
            plane = Plane.new
            expect(subject.land_plane(plane)).to eq("Plane #{plane.id} has landed!")
        end

        it "adds a landed plane to the Airport's list of planes" do
            p = Plane.new
            subject.land_plane(p)
            expect(subject.planes).to include(p)
        end
        it "raises an error when trying to land plane at an airport with stormy weather" do
            p = Plane.new
            subject.change_weather("stormy")
            expect{subject.land_plane(p)}.to raise_error "Error, too stormy to land plane #{p.id}"
        end
    end

    describe "#take_off" do
        it "returns 'Plane taken off!'" do
            p = Plane.new
            expect(subject.take_off(p)).to eq("Plane #{p.id} has taken off!")
        end
        it "removes plane from the list of planes" do
            p = Plane.new
            p2 = Plane.new
            subject.land_plane(p)
            subject.land_plane(p2)
            subject.take_off(p2)
            expect(subject.planes).to eq([p])
        end
        it "raises error if plane is taking off from an airport with stormy weather" do
            p = Plane.new
            subject.land_plane(p)
            subject.change_weather(:stormy)
            expect{subject.take_off(p)}.to raise_error "Error, too stormy to take off"
        end
        it "raises error when airport is full" do
            described_class::DEFAULT_CAPACITY.times{subject.land_plane(Plane.new)}
            expect{subject.land_plane(Plane.new)}.to raise_error "Error, Airport is full"
        end
    end
end