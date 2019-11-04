require 'airport'
describe Airport do
  it 'creates an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_instance_of(Airport)
  end
end

#instruct a plane to land at an airport
describe Airport do
 it {is_expected.to respond_to(:land).with(1). argument}
end

#instruct a plane to take off from an airport
describe Airport do
  it {is_expected.to respond_to(:takeoff).with(1). argument}
end 
