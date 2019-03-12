require './lib/airport'
require './lib/plane'

describe Airport do
	 # let(:default_capacity) { 20 }
	 before { allow(subject).to receive(:stormy).and_return(false) }
	 # before { allow(airport).to receive(:land).and_return(false) }

	 describe '#land' do 
 		 it 'lands a plane' do 
  			 plane = Plane.new
  			 expect(subject.land(plane)).to eq([plane])
  		end 

 		 it 'check if a plane in airport and returns that plane in airport' do
  			 plane = Plane.new
  			 subject.land(plane)
  			 expect(subject.planes).to eq([plane])
  		end 
 		# maybe move this somewhere

     it 'check if planes in airport and returns all planes in airport' do
        
        plane1 = Plane.new
        plane2 = Plane.new
         subject.land(plane1)
         expect(subject.land(plane2)).to eq [plane1, plane2]
     end 

 		 it 'prevents landing when weather is stormy' do
  			 plane = Plane.new
  			 subject.stormy = true
  			 expect { subject.land(plane) }.to raise_error 'cannot land'
  		end 

 		 it 'prevents landing and raises error when airport is full, if not it lands plane' do 
  			# p Airport::DEFAULT_CAPACITY
  	
  			 allow(subject).to receive(:default_capacity) { 20 }
  			 subject.default_capacity.times do 
   				 subject.land(Plane.new)
   			end 
  			# p subject.planes
  			 expect { subject.land(Plane.new) }.to raise_error 'Airport full'
  		end 

 		 it 'cannot land if already landed' do
  			 plane = Plane.new
  			 subject.land(plane)
  			 expect { subject.land(plane) }.to raise_error 'already landed'
  		end
 	end 

	 describe '#takeoff' do
 		 it 'takes off a plane and message or confirm plane is no longer in airport' do
  			 plane = Plane.new
  			 subject.land(plane)
  			 expect { subject.takeoff(plane) }.to output("Plane has taken off\n").to_stdout
  			 expect(subject.planes).to eq []
  		# checks 
  		end 

 		 it 'prevents takeoff when stormy' do  				
  			 plane = Plane.new
  			 subject.land(plane)
  			 subject.stormy = true
  			 expect { subject.takeoff(plane) }.to raise_error 'cannot takeoff'
  		end 

 		 it 'plane flying or in queue cannot take off' do
  			 plane = Plane.new
  			 expect { subject.takeoff(plane) }.to raise_error "Plane is currently flying or in queue"
  		end
 	end 

	 describe '#stormy?' do 
 		 it 'returns weather condition, if stormy or not' do 
  			 expect(subject.stormy?).to eq false
  		end 
 	end 

	 describe 'capacity' do 
 		 it 'it sets capacity and can land plane within capacity' do 
  			# p Airport::DEFAULT_CAPACITY
  			# Airport::DEFAULT_CAPACITY = 30 
  			 airport1 = Airport.new(30)
  			 airport1.stormy = false
  			# sets a new airport	with default 30 capacity		
  			 29.times do airport1.land(Plane.new)
   			end 
  			 expect(airport1.planes.count).to eq 29
  		end 
      it 'defaults to default capacity if capacity not set' do 
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end 
 	end 

  # describe 'random weather' do 
  #   it 'weather is randomly at 90/10 not stormy' do 
  #     airports = []
  #     100.times do 
  #       airports << Airport.new
  #     end

  #     airports.each do |x|
  #       x.random_weather
  #     end   
  #   end
  # end 
end
