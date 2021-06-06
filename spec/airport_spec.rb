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

    it "Check an plane that is in the sky is not landed" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        subject.land_plane(plane)
        allow(plane).to receive(:landed).and_return(true)
        subject.plane_takeoff(plane)
        expect(plane).to_not be_landed
    end

    it "Make sure an airplane that as taken off is not at the airport" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        subject.land_plane(plane)
        allow(plane).to receive(:landed).and_return(true)
        subject.plane_takeoff(plane)
        expect(subject.planes).to_not include(plane)
    end
    
    it "Prevent airplane to take off if not sunny" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        subject.land_plane(plane)
        subject.sunny = false
        error = "Weather Stormy cannot take off"
        expect{subject.plane_takeoff(plane)}.to raise_error error
    end

    it "Prevent airplane to land if not sunny" do
        subject.sunny = false
        error =  "Weather Stormy cannot land"
        expect{subject.land_plane(plane)}.to raise_error error
    end

    it "Raise an error if the airport is full" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
        expect{subject.land_plane(plane)}.to raise_error "Airport is full!"
    end

    it "Check to see if you can fill, remove then fill airport" do
        subject.sunny = true
        allow(plane).to receive(:landed).and_return(false)
        Airport::DEFAULT_CAPACITY.times { subject.land_plane(plane) }
        allow(plane).to receive(:landed).and_return(true)
        subject.plane_takeoff(plane)
        expect(subject.planes).to include(plane)
    end
end
