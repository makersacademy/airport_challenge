require "plane"

describe Plane do

	 before do
 		 weather = double(:Weather, :stormy? => false)
 		 @airport = double("Airport", :planes => [])
 		 allow(@airport).to receive_messages(:weather => weather, :remove_plane => nil, :add_plane => nil, :plane_at_airport? => nil)
 	end
	 subject { Plane.new(@airport) }

	 it "Plane has to be given a starting airport when created" do
 		 @airport.weather.stormy?
 		 expect { Plane.new }.to raise_error(ArgumentError)
 	end	

	 context "Landing:" do
 		 it "Responds to #land" do
  			 expect(subject).to respond_to :land
  		end

 		 it "#land requires a parameter" do
  				expect { subject.land }.to raise_error(ArgumentError)
  		end

 		 it "Plane cannot land if not flying" do
  			 expect { subject.land(@airport) }.to raise_error "Plane already landed"
  		end

 		 it "Sets state of plane to landed after landing" do
  			 allow(@airport).to receive_messages(
   				:planes => [subject],
   				:plane_at_airport? => true)
  			 subject.takeoff(@airport)
  			 subject.land(@airport)
  			 expect(subject.flying).to eq false
  		end
 	end

	 context "Takeoff:" do

 		 before do
  			 allow(@airport).to receive_messages(
   				:planes => [subject],
   				:plane_at_airport? => true)
  		end

 		 it "Responds to #takeoff" do
  				expect(subject).to respond_to :takeoff
  		end

 		 it "#takeoff accepts a parameter" do
  			 expect { subject.takeoff(@airport) }.to_not raise_error(ArgumentError)
  		end

 		 it "Plane cannot takeoff if already flying" do
  			 subject.takeoff(@airport)
  			 expect { subject.takeoff(@airport) }.to raise_error "Plane already flying"
  		end

 		 it "Sets state of plane to flying after takeoff" do
  			 subject.takeoff(@airport)
  			 expect(subject.flying).to eq true
  		end

 		 it "Cannot takeoff from airport if stored at different airport" do
  			 airport = double("Airport")
  			 allow(airport).to receive_messages(
   				:planes => [],
   				:plane_at_airport? => false,
   				:weather => nil)
  			 expect { subject.takeoff(airport) }.to raise_error "Plane at different airport"
  		end
 	end

	 context "Weather:" do

 		 context "Landing:" do
  			 before do
   				 allow(@airport).to receive(:plane_at_airport?) { true }
   				 subject.takeoff(@airport)
   			end

  			 it "Can land if weather is not stormy" do	
   				 weather = double(:Weather, :stormy? => false)	
   				 expect { subject.land(@airport, weather) }.to_not raise_error 
   			end
  	
  			 it "Cannot land if weather is stormy" do
   				 weather = double(:Weather, :stormy? => true)
   				 expect { subject.land(@airport, weather) }.to raise_error "Weather stormy cannot land"
   			end
  		end

 		 context "Takeoff:" do
  			 before do
   				 allow(@airport).to receive(:plane_at_airport?) { true }
   			end 

  			 it "Can takeoff from airport if weather is not stormy" do
   				 weather = double(:Weather, :stormy? => false)
   				 expect { subject.takeoff(@airport, weather) }.to_not raise_error 
   			end
  			
  			 it "Cannot takeoff from airport if weather is stormy" do
   				 weather = double(:Weather, :stormy? => true)
   				 expect { subject.takeoff(@airport, weather) }.to raise_error "Weather stormy cannot take off"
   			end
  		end
 	end

end
