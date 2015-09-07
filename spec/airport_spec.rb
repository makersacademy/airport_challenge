require 'airport'

describe Airport do

	let(:airport) { Airport.new }
  	let(:plane) { Plane.new }

	describe "landing" do 
	it { is_expected.to respond_to(:to_land).with(1).argument}

    it 'add one plane after landing' do    # we should add to our store plane when it has been landed
		airport.to_land(plane)
		end 

  it 'raises an error when an airport is full' do
    subject.capacity.times { subject.to_land Plane.new }
    expect { subject.to_land Plane.new }.to raise_error 'Airport is full'
  end
  
  it "Raise an error when a plane is landing in a stormy weather" do	
		subject.to_land(plane)
    expect {subject.to_land(plane)}.to raise_error "Plane can't land, because of the stormy weather"
		end 

 	end 

	describe 'take off' do

	it { is_expected.to respond_to(:take_off).with(1).argument}
 
    it "the number of planes is decreasing when plane take off" do 
		airport.take_off(plane)
		end 

    it "Raise an error when a plane is taking off in a stormy weather" do	
      subject.take_off(plane)
      expect {subject.take_off(plane)}.to raise_error "Can't take off in stormy weather"
		end 
    
	end 
	
end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

   
