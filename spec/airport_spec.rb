require_relative '../lib/airport.rb'

RSpec.describe Airport do
  describe '#land' do 
  let(:temp) {Airport.new}
  
    it 'Allows a plane to land at an airport' do 
      expect(temp.land).to eq true
    end 

    it 'confirms if the hangar is full or not' do 
      i = 1
      until i == 6 do 
        plane = "plane_" + i.to_s
        i += 1
        temp.add_plane(plane)
      end 
      expect {temp.full_hangar?(1)}.to raise_error 'The hangar is full'
    end 

    it 'Allows a plane to depart' do 
      temp.add_plane ("plane_1")
      expect(temp.take_off("plane_1")).to eq "plane_1 has departed"
    end


    it 'Confirms planes are no longer in the airport' do #This is the same as 'Allows a plane to depart' just with diff output text
      temp.add_plane ("plane_1")
      expect(temp.hangar("plane_1")).to eq "plane_1 is no longer in the hangar"
    end 

    it 'changes the capacity of an airport' do 
      temp.airport_capacity(10)
      expect(temp.airport_capacity(10)).to eq "The airport's capacity is 10"
    end

    it 'Prevents take off when weather is stormy' do 
      allow(subject.weather("stormy")).to receive("stormy").and_return 'You cannot takeoff as the weather is stormy'
      expect(temp.weather("stormy")).to eq "You cannot takeoff as the weather is stormy."
      #allow(subject.class_name(parameter_1)).to receive("parameter_1").and_return EXPECTED OUTPUT
      #expect(temp.method_name(parameter_1)).to eq EXPECTED OUTPUT
    end

  end
end


#5.
# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

#4.
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# 3. Done
# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 


# 2. Done
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

# 1. Done
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport