require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to :take_off }

  it 'should not land if the airport is full' do
    expect{land(plane)}.to raise_error "full"
  end  
end

#  it 'should land at an airport' do
#    airport = Airport.new 
#    plane = @plane
#    expect(lan
#  end  
# end        


# I want to instruct a plane to land at an airport
# I want to prevent landing when the airport is full 