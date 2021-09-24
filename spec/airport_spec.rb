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

    it "Should check a Plane exists" do
        subject.land_plane
        expect(subject.search_for_plane).to eq "This plane is in the Airport"
    end

    it { is_expected.to respond_to :check_ap_capacity, :update_max_cap }

    it "Should return true or false when calling check_ap_capacity" do
        expect(subject.check_ap_capacity).to eq(true || false)
    end

    it "Should return max_cap" do
        num = 3
        expect(subject.update_max_cap(num)).to eq(num)
    end
end