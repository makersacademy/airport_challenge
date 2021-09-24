require 'airport'

describe Airport do
    it { is_expected.to respond_to :land_plane }

    it "Should checks that land_plane adds a Plane object to my_airport[]" do
        expect(subject.land_plane).to include(Plane)
    end

    it { is_expected.to respond_to :take_off, :search_for_plane }

    it "Should checks that take_off removes a Plane object from my_airport[]" do
        subject.land_plane
        expect(subject.take_off).to eq @my_airport
    end

    it "Should check for the plane" do
        subject.land_plane
        expect(subject.search_for_plane).to eq "This plane is in the Airport"
    end

end