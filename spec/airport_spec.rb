require 'spec_helper'

describe Airport do
    
    let(:flying_plane) {double :plane, flying?: true}
    let(:landed_plane) {double :plane, flying?: false}
    
    
    
    context "Launch tests" do
        
        it "let a grounded plane launch:" do
            plane = Plane.new
            subject.land(plane)
            subject.launch(plane)
            expect(plane).to be_flying
        end
        
        it "wont let a flying plane launch" do
            expect { subject.launch(flying_plane) }.to raise_error "Cant take off. Plane is flying."
        end    
    end

    context "Landing tests:" do
        
        it 'lets a flying plane land' do
            plane = Plane.new
            subject.land(plane)
            expect(plane).not_to be_flying
        end
        
        it "wont let a grounded plane land" do
            allow(landed_plane).to receive(:flying).with(no_args)
            expect { subject.land(landed_plane) }.to raise_error "Cant land, the plane isnt flying"
        end
    end

    context "Capacity tests:" do
        
        it "has a default capacity" do
            expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
        end
    
        it "has a variable capacity" do
            subject.capacity = 20 
            expect(subject.capacity).to eq 20
        end
    end
    

    

end