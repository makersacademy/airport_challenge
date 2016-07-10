require "plane"

describe Plane do

  it {is_expected.to respond_to(:land)}
  it {is_expected.to respond_to(:confirm_landing)}
  it {is_expected.to respond_to(:takeoff)}
  it {is_expected.to respond_to(:confirm_takeoff)}

  it 'is landed when on the ground' do
    plane = Plane.new
    plane.land(plane)
    plane.instance_variable_get(:@landed).should eq true
  end

  it 'is not landed when airborne' do
    plane = Plane.new
    plane.takeoff(plane)
    plane.instance_variable_get(:@landed).should eq false
  end

end
