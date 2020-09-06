require 'airport'

describe Airport do


    it { is_expected.to respond_to(:land).with(1).arguments }

    it { is_expected.to respond_to(:take_off).with(0).arguments }



    context "Stormy Weather landing" do

        it "Stormy weather, full capacity, plane flying - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather).and_return("Sunny")
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end
            allow(gatwick).to receive(:weather).and_return("Stormy")
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).to raise_error "Stormy weather cannot land"}
        end

        it "Stormy weather, full capacity, plane already landed - will not land" do
            
            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "Stormy weather cannot land"}
        end

        it "Stormy weather, not full capacity, plane flying - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).to raise_error "Stormy weather cannot land"}
        end

        it "Stormy weather, not full capacity, plane already landed - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "Stormy weather cannot land"}
        end
    end

   
  context "Sunny Weather landing" do

        it "Sunny weather, full capacity, plane flying - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end

            allow(gatwick).to receive(:weather) {"Sunny"}
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).to raise_error "The airport is full"}
        end

        it "Sunny weather, full capacity, plane already landed - will not land" do
            
            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "The airport is full"}
        end


        it "Sunny weather, not full capacity, plane flying - will land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).not_to raise_error}
        end

        it "Sunny weather, not full capacity, plane already landed - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "Plane is landed"}
        end
    end
=begin
context "Stormy Weather taking off" do

        it "Stormy weather, full capacity, plane flying - will not take off" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => true, :flying? => true)
            expect {gatwick.take_off(plane1).to raise_error "It's stormy"}
        end

        it "Stormy weather, full capacity, plane already landed - will not take off" do
            
            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :flying? => false)
            
            expect {gatwick.take_off(plane1).to raise_error "It's stormy"}
        end


        it "Stormy weather, not full capacity, plane flying - will not take off" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => true)
            
            expect {gatwick.land(plane1).to raise_error "dsdsdfdIt's stormy"}
        end

        it "Stormy weather, not full capacity, plane already landed - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "Stormy weather cannot land"}
        end
    end

   
  context "Sunny Weather landing" do

        it "Sunny weather, full capacity, plane flying - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end

            allow(gatwick).to receive(:weather) {"Sunny"}
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).to raise_error "The airport is full"}
        end

        it "Sunny weather, full capacity, plane already landed - will not land" do
            
            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "The airport is full"}
        end


        it "Sunny weather, not full capacity, plane flying - will land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).not_to raise_error}
        end

        it "Sunny weather, not full capacity, plane already landed - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "Plane is landed"}
        end
    end

    context "Stormy Weather landing" do

        it "Stormy weather, full capacity, plane flying - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end
    
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).to raise_error "Stormy weather cannot land"}
        end

        it "Stormy weather, full capacity, plane already landed - will not land" do
            
            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "Stormy weather cannot land"}
        end

        it "Stormy weather, not full capacity, plane flying - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).to raise_error "Stormy weather cannot land"}
        end

        it "Stormy weather, not full capacity, plane already landed - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "Stormy weather cannot land"}
        end
    end

   
  context "Sunny Weather landing" do

        it "Sunny weather, full capacity, plane flying - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end

            allow(gatwick).to receive(:weather) {"Sunny"}
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).to raise_error "The airport is full"}
        end

        it "Sunny weather, full capacity, plane already landed - will not land" do
            
            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane0 = double("plane", :takeoff => false, :land => true, :flying? => true)
            gatwick.capacity.times do
                gatwick.land(plane0)
            end
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "The airport is full"}
        end


        it "Sunny weather, not full capacity, plane flying - will land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Sunny"}
            plane1 = double("plane", :takeoff => false, :land => true, :flying? => true)
            
            expect {gatwick.land(plane1).not_to raise_error}
        end

        it "Sunny weather, not full capacity, plane already landed - will not land" do

            gatwick = Airport.new
            allow(gatwick).to receive(:weather) {"Stormy"}
            plane1 = double("plane", :takeoff => false, :land => false, :flying? => false)
            
            expect {gatwick.land(plane1).to raise_error "Plane is landed"}
        end
    end
=end
end

