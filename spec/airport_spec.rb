require './lib/airport.rb'

describe Airport do

    let(:plane) {double :plane, :landed= => false, landed?: false}
    let(:weather) {double :weather, :sunny= => true, sunny?: true}

    it { is_expected.to respond_to :land_plane }
    
    it { is_expected.to respond_to(:land_plane).with(1).argument }
    
    it { is_expected.to respond_to :planes }

    it "Checks if there are no planes already at the airport" do
        expect(subject.planes).to eq []
    end

    it { is_expected.to respond_to :plane_takeoff }

    it { is_expected.to respond_to(:plane_takeoff).with(1).argument }

    it "Land plane then take off" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        subject.land_plane(plane)
        allow(plane).to receive(:landed).and_return(true)
        expect(subject.plane_takeoff(plane)).to eq plane
    end

    it "Check a plane that is in the sky has not landed" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        subject.land_plane(plane)
        allow(plane).to receive(:landed).and_return(true)
        subject.plane_takeoff(plane)
        expect(plane).to_not be_landed
    end

    it "Make sure a plane that as taken off is not at the airport" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        subject.land_plane(plane)
        allow(plane).to receive(:landed).and_return(true)
        subject.plane_takeoff(plane)
        expect(subject.planes).to_not include(plane)
    end
    
    it "Prevent a plane to take off if it's not sunny" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        subject.land_plane(plane)
        subject.sunny = false
        expect{subject.plane_takeoff(plane)}.to raise_error "Weather is stormy so cannot take off"
    end

    it "Prevent a plane to land if it's not sunny" do
        subject.sunny = false
        expect{subject.land_plane(plane)}.to raise_error "Weather is stormy so cannot land"
    end

    it "Raise an error if the airport is full" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
        expect{subject.land_plane(plane)}.to raise_error "Airport is full!"
    end

    it "Check airport capacity" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
        allow(plane).to receive(:landed).and_return(true)
        subject.plane_takeoff(plane)
        expect(subject.planes).to include(plane)
    end

    it "Overwrite default airport capacity to 70" do
        expect(subject.capacity=70).to eq 70
    end
end
