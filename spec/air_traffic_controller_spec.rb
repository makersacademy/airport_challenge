require 'air_traffic_controller.rb'

RSpec.describe 'AirTrafficController' do
  context 'When describing the air traffic controller' do
    it 'Should be able to send an instruction to a plane to land' do
      bob = AirTrafficController.new
      expect(bob.landing_instruction) .to eq "please land"
    end
    it 'Should be able to send an instruction to a plane to take off' do
      bob = AirTrafficController.new
      expect(bob.takeoff_instruction).to eq "please takeoff"
    end
  end
end
