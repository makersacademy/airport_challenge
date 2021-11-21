require 'airport'
require 'plane'

describe Airport do 

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  describe '#land' do

    context "When not stormy" do

      before(:each) do
        allow(@airport).to receive(:stormy?).and_return(false)
      end

      it { is_expected.to respond_to :land }

      it "When I land a plane, I expect that plane to be at the airport" do 
        @airport.land(@plane)
        expect(@airport.planes).to include @plane
      end

      it "Prevents landing a plane when the airport is full" do 
        @airport.capacity.times { @airport.land Plane.new }
        expect { @airport.land @plane }.to raise_error "Airport is full"
      end

      it "Cannot land a plane that has already landed" do 
        @airport.land(@plane)
        expect { @airport.land(@plane) }.to raise_error "This plane has already landed"
      end

    end

    context "when stormy" do 
        
      before(:each) do
        allow(@airport).to receive(:stormy?).and_return(true)
      end

      it "Plane should not be able to land" do 
        expect { @airport.land(@plane) }.to raise_error "Stormy weather, can't land"
      end

    end

  end
  
  describe '#take_off' do

    context "when not stormy" do

      before(:each) do
        allow(@airport).to receive(:stormy?).and_return(false)
      end

      it { is_expected.to respond_to :take_off }

      it "After instructing a plane to take off, I expect that plane to not be in the airport if the weather is not stormy" do 
        @airport.land(@plane)
        @airport.take_off
        expect(@airport.planes).to be_empty
      end

      it "Cannot take off from an empty airport" do 
        expect { @airport.take_off }.to raise_error "Airport is empty, no planes can take off"
      end
    
    end
      
    context "when stormy" do 

      before(:each) do
        allow(@airport).to receive(:stormy?).and_return(true)
      end

      it "If the weather is stormy, you should not be able to take off" do 
        allow(@airport).to receive(:stormy?).and_return(false)
        @airport.capacity.times { @airport.land Plane.new }
        allow(@airport).to receive(:stormy?).and_return(true)
        expect { @airport.take_off }.to raise_error "Stormy weather, can't take off"
      end

    end    

  end
  
  describe '#capacity' do
    it "You can set the capacity of the airport" do 
      @airport.capacity = 10
      expect(@airport.capacity).to eq 10
    end
    
  end

end
