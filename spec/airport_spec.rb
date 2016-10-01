require 'spec_helper'

describe Airport do
    
    
    let(:flying_plane) {double :plane, flying?: true}
    let(:landed_plane) {double :plane, flying?: false}
    
    it 'lets a flying plane land' do
        plane = Plane.new
        subject.launch(plane)
        subject.land(plane)
        expect(plane).not_to be_flying
    end

    it "allows a grounded plane to takeoff" do
        plane = Plane.new
        subject.launch(plane)
        expect(plane).to be_flying
    end

    it "won't allow a flying plane to take off" do
        expect { subject.launch(flying_plane) }.to raise_error "Cant take off. Plane is flying."
    end
    
    it "has a default capacity" do
        expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end
    
    it "has a variable capacity" do
        subject.capacity = 10 
        expect(subject.capacity).to eq 10
    end
end