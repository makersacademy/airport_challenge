require 'airport.rb'

describe Airport do
	describe 'capacity' do
	    	it 'user can set capacity value' do
	    		subject.capacity = 10
	    		expect(subject.capacity).to eq(10)
	    	end
    
	    	it 'default for capacity is 5' do
	    		expect(subject.capacity).to eq(5)
	    	end
	end

	 describe '#land' do
	      it { is_expected.to respond_to(:land).with(1).argument }


	      it 'lands a plane in the airport' do 
	        test_plane = Plane.new
	        subject.land(test_plane)
	        expect(subject.hanger[0]).to eq(test_plane)
	      end   
	      it 'raises an error and does not let plane land if stormy' do
	           test_plane = Plane.new
	           allow(subject).to receive(:stormy?) {true}
	           expect { subject.land(test_plane) } .to raise_error("Too stormy to land")
	      end
	      it 'raises an error if the plane has already landed' do
	      	   test_plane = Plane.new
	      	   subject.land(test_plane)
               expect { subject.land(test_plane) } .to raise_error("Plane already landed")
          end
      end 
	 
	 describe '#take_off' do
	      it { is_expected.to respond_to(:take_off).with(1).argument }
	      it 'makes a plane take off from the airport' do
	           test_plane = Plane.new
	           subject.land(test_plane)
	           subject.take_off(test_plane)
	           allow(subject).to receive(:stormy?) {false}
	           expect(subject.hanger).to be_empty
          end

          it 'raises an error when the weather is stormy' do
               test_plane = Plane.new
               subject.land(test_plane)
               allow(subject).to receive(:stormy?) {true}
		       expect { subject.take_off(test_plane) } .to raise_error("Too stormy to take off")
		  end
     end      
end