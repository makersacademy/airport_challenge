require 'airport'

describe Airport do 
    subject(:airport) {described_class.new}
    let(:plane) {double :plane}

    describe "#land" do 

        it "instructs a plane to land" do 
            expect(airport).to respond_to(:land).with(1).argument
        end 
    end 

    describe "#take_off" do 

        it "instructs a plane to take off" do 
            expect(airport).to respond_to(:take_off).with(1).argument
        end 

        it "confirms plane left airport once take_off" do 
            expect(airport.take_off_info).to eq("Plane have left the airport")
        end 
    end 


    describe "is_full?" do 
        # private method
        # it "prevents landing when airport is full" do 
        #     expect(airport).to respond_to(:full?)
        # end 

        it "should raise an error when airport is full" do 
            allow(airport).to receive(:stormy?).and_return false 
            50.times {airport.land(plane)}
            expect {airport.land(plane) }.to raise_error "Airport full, no planes allowed"
        end  
    end 

    describe "is_stormy?" do 
        it "prevent landing when is stormy" do 
            allow(airport).to receive(:stormy?).and_return true 
            expect {airport.land(plane) }.to raise_error "Landing not allowed, stormy weather"
        end 
    end 
end 