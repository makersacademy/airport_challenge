require 'air_traffic_controller.rb'
require 'plane.rb'

RSpec.describe 'AirTrafficController' do
  
  bob = AirTrafficController.new
  a380 = Plane.new
  
  it 'Should be able to send an instruction to a plane to land' do 
    expect(bob.landing_instruction).to eq "please land"
  end
  
  it 'Should be able to send an instruction to a plane to take off' do
    expect(bob.takeoff_instruction).to eq "please takeoff"
  end

end
