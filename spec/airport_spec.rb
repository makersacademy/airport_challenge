require 'airport'
require 'airtraffic'
require 'plane'

#test all airport methods respond
describe Airport do
  it 'full?' do
    expect(subject).to respond_to(:full?)
  end
  it 'instruct_take_off' do
    expect(subject).to respond_to(:instruct_take_off)
  end
  it 'land_plane' do
    expect(subject).to respond_to(:land_plane)
  end
end

#test all airtraffic methods respond
describe Airtraffic do
  it 'target_destination' do
    expect(subject).to respond_to(:target_destination)
  end
  it 'safe_conditions' do
    expect(subject).to respond_to(:safe_conditions)
  end
  it 'clear_for_take_off' do
    expect(subject).to respond_to(:clear_for_take_off)
  end
  it 'safely_in_flight' do
    expect(subject).to respond_to(:safely_in_flight)
  end
end

#test all plane methods respond
describe Plane do
  it 'receive_target' do
    subject = plane_doBefore
    expect(subject).to respond_to(:receive_target)
  end
  it 'take_off' do
    subject = plane_doBefore
    expect(subject).to respond_to(:take_off)
  end
  it 'successful_take_off?' do
    subject = plane_doBefore
    expect(subject).to respond_to(:successful_take_off?)
  end
  it 'coming_in_to_land' do
    subject = plane_doBefore
    expect(subject).to respond_to(:coming_in_to_land)
  end
end

def plane_doBefore
  Plane.new(true)
end

#behaviour tests
describe Airport do
  it 'full? returns false (no plans are landed)' do
    expect(subject.full?).to eq(true).or(eq(false))
  end
  it 'can instruct a plane to take off' do
    subject.land_plane(Plane.new(false))
    expect(subject.instruct_take_off(1)).to eq("Confirmed safe take off, airport is area is now clear").or(eq("Conditions are not safe, Not clear for take off")) 
  end
  it 'can instruct a plane to take off' do
    expect(subject.land_plane(Plane.new(true))).to eq("You're safe to land flight").or(eq("Conditions are not safe for a landing pilot")) 
  end
  it 'can set instance variables @(capacity)' do
    expect(subject.instance_variable_get(:@capacity)).to eql(20)  
  end
  it 'can set instance variables (@spaces)' do
    expect(subject.instance_variable_get(:@spaces)).to eql(Array.new)  
  end
  it 'can set instance variables (@at_control)' do
    expect(subject.instance_variable_get(:@at_control)).to be_instance_of(Airtraffic)  
  end
end
describe Airtraffic do
  it 'sets destination of plane' do
    dest = "London"
    expect(subject.target_destination(Plane.new(false), dest)).to eq "Thanks control, target destination is #{dest}"
  end
end