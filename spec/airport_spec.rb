require 'airport'

describe Airport do
    describe ".land" do
        it "allowes an airplane to land at the airport" do
            gatwick = Airport.new
            planes = gatwick.land(["A100"])
            expect(planes.length).to eq 1
            expect(planes).to eq ["A100"]
            # Airport.new
            # allow(Airport).to receive(:rand)
        end
    end

    describe ".takeoff" do
        it "allowes an airplane to takeoff from the airport" do
            Airport.new
            allow(Airport).to receive(:rand)
        end
    end

    describe ".full?" do
        it "disallowes an airplane to land if the airport is full" do
            expect { airport.land }.to raise_error "Airport is full"
        end
    end
end
