

require 'Airport.rb'


describe Airport do
  it { is_expected.to respond_to :land_plane }

  it 'test that hanger is not empty' do
    plane_1 = Plane.new
    subject.land_plane(plane_1)
    expect(subject.hanger_check.include? plane_1).to eq true
  end

  it 'Test that hanger is empty when take_off' do
    plane_2 = Plane.new
    subject.take_off(plane_2)
    expect(subject.hanger_check.include? plane_2).to eq false 
  end

  it 'return statment when plane takes off or lands' do
    plane_3 = Plane.new
    subject.take_off(plane_3)
    expect(subject.air_traffic_controller(plane_3)).to eq "The plane has taken off"
  end

  describe 'Initialization' do
    subject{Airport.new}
    let(:plane) {Plane.new}
    it 'Default_capacity' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land_plane(plane)
      end
      expect{subject.land_plane(plane)}.to raise_error "Cannot land, Hanger full"
    end
  end

  describe '#land_plane' do
    it 'raised error and print statement when no planes' do
      subject.capacity.times {subject.land_plane(Plane.new)}
      expects {subject.land_plane(Plane.new)}.to raise_error "Cannot take off, No plane available"
    end
  end

  # describe '#take_off' do
  #   it 'raises message when no planes available' do
  #     expect {subject.take_off(Plane.new)}.to raise_error "Cannot take off, No plane available"
  #   end
  # end

  # describe '#land_plane' do
  #   it 'Raises error message when No room in hanger' do
  #     subject.capacity.times {subject.land_plane(Plane.new)}
  #     expect{subject.land_plane(Plane.new)}.to raise_error "Cannot land, Hanger full"
  #   end
  # end
end

  # context "Weather check, if weather is < 7 weather is good" do
  #   describe "#weather" do
  #     it "return true is weather is < 7" do
  #       weather_check = Plane.new(weather: 5)
  #       expect(weather_check.weather?).to eq (ture)
  #     end
  #   end
  # end




  # describe '#land_plane' do
  #   it "raised error statement when @hanger full" do
  #     Airport::DEFAULT_CAPACITY.times {subject.land_plane(Plane.new)}
  #     expect {subject.land_plane(Plane.new)}.to raise_error "Cannot land, Airport full"
  #   end
  # end

  # describe 'Initialization' do
  #   subject{Airport.new}
  #   let(:plane) {Plane.new}
  #   it 'Default_capacity' do
  #     Airport::DEFAULT_CAPACITY.times do
  #       subject.land_plane(plane)
  #     end
  #     expect{subject.land_plane(plane)}.to raise_error "Cannot land, Airport full"
  #   end
  # end

  # it 'Test for capacity of airport set to 20 planes' do
  #   plane_4 = Plane.new
  #   Airport::DEFAULT_CAPACITY.times {plane_4}
  #   expect {subject.land_plane(plane_4)}.to raise_error "Cannot land, Airport full"
  # end


  # it 'checks capacity of hanger and return '

# require "Airport.rb"

# describe Airport do

#   context 'it test Plane attribute is taken in Airport class' do
#     it { is_expected.to respond_to :land_plane}
#   end

#   it 'land_plane takes instance on plane when called' do
#     plane_1 = Plane.new
#     expect(subject.land_plane(plane_1)).to eq plane_1
#   end

#   it 'when plane_land called that Hanger holds plane' do
#     plane_2 = Plane.new
#     subject.land_plane(plane_2)
#     expect(subject.hanger_check.include? plane_2).to eq true 
#   end

# end


  # it 'when plane_land called that Hanger holds plane' do
  #   plane_2 = Plane.new
  #   subject.land_plane(plane_2)
  #   expect(subject.hanger_check.include? plane_2).to eq true 
  # end

  # it 'when plane_land called that Hanger holds plane' do
  #   plane_2 = Plane.new
  #   subject.land_plane(plane_2)
  #   expect(subject.land_plane(@hanger)).not_be empty 

  # it 'Test when instructed plan_land, plane_land hold plane' do
  #   plane_1 = Plane.new
  #   expect(subject)




# describe Airport do

#   it { is_expected.to respond_to(:plane) }

#   it{ is_expected.to respond_to(:land_plane).with(1).argument }


#   it 'It tests that land_plane can take variable plane' do
#     plane_1 = Plane.new
#     expect(subject.land_plane(plane_1)).to eq plane_1
#   end

#   it 'It tests that Take_off can take a instance variable' do
#     plane_1 = Plane.new
#     expect(subject.take_off(plane_1)).to eq plane_1
#   end

#   it 'Test when land_plane then Hanger is not empty' do
#     plane_1 = Plane
#     plane_1.land_plane(plane_1)
#     expect(subject.hanger)

# end


  # it 'Test that Land_plane hold instance plane' do 
  #   plane_1 = Plane.new
  #   plane_1.land_plane(plane_1)
  #   expect(subject.land_plane(plane_1)).to eq plane_1
  # end





  # it 'Test that land_plane adds plane to Hanger' do
  #   plane_1 = Plane.new
  #   subject.land_plane(plane_1) 
  #   expect(subject.land_plane(@hanger)).not_to be_empty
  #   # expect(subject.hanger.include? plane).to eq true
  # end

  # it 'Test that when a plane takes off the Hanger has removed plane' do
  #   plane_1 = Plane.new
  #   subject.land_plane(plane_1)
  #   subject.take_off(plane_1)
  #   expect(subject.)

  # it "test that when plane lands Hanger takes bike" do
  #   plane_1 = Plane.new
  #   plane_1.land_plane
  #   expect(@hanger).not_to be_empty
  # end




#   it 'lands plane interacts' do
#     plane = Plane.new
#     expect(subject.land_plane(plane)).to eq plane
#   end

#   it 'plane takes off interacts' do
#     plane = Plane.new
#     expect(subject.take_off(plane)).to eq plane
#   end

#   it 'test when plane lands the hanger holds plane' do
#     plane = Plane.new
#     subject.land_plane(plane)
#     expect(subject.land_plane(@hanger)).not_to be_empty
#   end

# end



  # it 'docks something' do
  #   bike = Bike.new
  #   expect(subject.dock(bike)).to eq [bike]
  # end 


