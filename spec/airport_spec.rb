require 'spec_helper'

describe Airport do
    
    let(:flying_plane) {double :plane, flying?: true}
    let(:landed_plane) {double :plane, flying?: false}
    
    it 'lets a flying plane land' do
        plane = Plane.new
        subject.land(plane)
        expect(plane).not_to be_flying
    end

    it "allows a grounded plane to takeoff" do
        plane = Plane.new
        plane.flying = false
        subject.launch(plane)
        expect(plane).to be_flying
    end
    
    it "has a default capacity" do
        expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end
end