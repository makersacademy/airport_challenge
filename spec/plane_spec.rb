require 'plane'



describe Plane do

end




	# class Airport;	end  #needed to test for checking class of airport double
	# #setup airport double for unit tests to keep DRY    
	# def airport_double(airport_class=true)
	# 	airport = double(:airport_object)
	#   allow(airport).to receive(:is_a?).with(Airport).and_return(airport_class)
	#   return airport
	# end

	# describe 'method:flying?' do
	# 	it do expect(subject).to respond_to(:flying?).with(0).argument end
	# end

	# describe 'method:new/initialize' do
	#   it 'is flying when created' do 
	#   	expect(subject).to be_flying
	#   end
	# end

 #  describe 'method:land' do
	# 	it 'can land at a specified Airport' do
	#   	expect(subject).to respond_to(:land).with(1).argument
	#   end
	#   it 'raises error when not given a valid airport object as destination' do
	#   	airport = airport_double(false)
	# 		expect{subject.land(airport)}.to raise_error 'Not an airport'
	#   end
	#   it 'is landed/not-flying after landing' do
	#   	airport = airport_double
	#   	subject.land(airport)
	#   	expect(subject).to_not be_flying
	#   end
 #  end

 #  describe 'method:take_off' do
	#   it do expect(subject).to respond_to(:take_off).with(0).argument end
	#   it 'raises error when trying to take off while in the air' do
	#   	expect{subject.take_off}.to raise_error "Can't take off while already flying"
	#  	end 
	#   it 'is flying after take off' do
	#   	airport = airport_double	
	#   	subject.land(airport)
	#   	subject.take_off
	#   	expect(subject).to be_flying
	#   end
	# end


#####################################


## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying"
# and landed?
# Are you testing that?

############### OLD WORKING CODE ################

# describe Plane do

#   it 'is flying when created' do 
#   	expect(subject).to be_flying
#   end

#   describe 'method:land' do
# 		it 'can land at a specified Airport' do
# 	  	expect(subject).to respond_to(:land).with(1).argument########
# 	  end
# 	  it 'raises error when not given a valid airport object as destination' do
# 	  	airport = double(:none_airport_object)
# 	  	allow(airport).to receive(:is_a?).with(Airport).and_return(false)
# 	  	expect{subject.land(airport)}.to raise_error 'Not an airport'
# 	  end
# 	  it 'raises error when trying to land while weather at the airport is stormy' do
# 	  	airport = double(:airport_object)
# 	  	allow(airport).to receive(:is_a?).with(Airport).and_return(true)
# 	  	allow(airport).to receive(:is_stormy?).and_return(true)
# 	  	expect{subject.land(airport)}.to raise_error "Can't land in stormy weather"
# 	  end	
# 		it 'raises error when trying to land at a full airport' do
# 	  	airport = double(:airport_object)
# 	  	allow(airport).to receive(:is_a?).with(Airport).and_return(true)
# 	  	allow(airport).to receive(:is_stormy?).and_return(false)
# 	  	allow(airport).to receive(:is_full?).and_return(true)
# 	  	expect{subject.land(airport)}.to raise_error "Can't land at a full airport"
# 	  end	
# 	  it 'is landed after landing' do
# 	  	airport = double(:airport_object)
# 	  	allow(airport).to receive(:is_a?).with(Airport).and_return(true)
# 	  	allow(airport).to receive(:is_stormy?).and_return(false)
# 	  	allow(airport).to receive(:is_full?).and_return(false)
# 	  	subject.land(airport)
# 	  	expect(subject).to_not be_flying
# 	  end
#   end





#   # it 'can take off' do
#   # 	expect(subject).to respond_to(:take_off)
#   # end

#   # it 'is flying after take off' do
#   # 	subject.land
#   # 	subject.take_off
#   # 	expect(subject).to be_flying
#   # end

# end






