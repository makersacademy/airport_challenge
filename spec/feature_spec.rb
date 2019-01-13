# require 'airport'
# require 'plane'
# require 'weather'

# RSpec.describe 'Feature Tests' do

#   let(:subject) { Airport.new }
#   let(:plane_1) { Plane.new(subject) }
#   let(:plane_2) { Plane.new(subject) }

#   context 'when taking off' do
#     before do
#       allow(Weather).to receive(:current) { "safe" }
#       subject.land(plane_1)
#       subject.land(plane_2)
#     end

#     it 'takeoff a plane' do
  
#       subject.takeoff(plane_1)
#       expect(subject.planes).not_to include plane_1
#     end

#     it 'prevent takeoff when stormy' do 
      
#       allow(Weather).to receive(:current) { "safe" }
#       subject.land(plane_1)
  
#       allow(Weather).to receive(:current) { "stormy" }
#       expect { subject.takeoff(plane_1) }.to raise_error(Airport::TAKEOFF_ERROR_MESSAGE)
#     end
#   end

#   context 'when landing' do 

#   end
#   it 'prevent landing when stormy' do 
#     allow(Weather).to receive(:current) { "stormy" }
#     expect { subject.land(plane_1) }.to raise_error(Airport::LANDING_ERROR_MESSAGE)
#   end

#   it 'prevent landing when full' do 
#     subject.capacity = 5
#     allow(Weather).to receive(:current) { "safe" }

#     subject.capacity.times {
#       subject.land(Plane.new(subject))
#     }
    
#     error_message = Airport::LANDING_ERROR_MESSAGE 
#     expect { subject.land(Plane.new(subject)) }.to raise_error error_message
#   end

#   it 'change airport capacity' do 
#     subject.capacity = 3

#     expect(subject.capacity).to be 3
#   end

#   it 'land multiple planes' do 
#     allow(Weather).to receive(:current) { "safe" }
#     subject.capacity = 3

#     subject.capacity.times { subject.land(Plane.new(subject)) }
    
#     expect(subject.planes.length).to be 3
#   end

#   describe 'Edge Cases' do
#     context 'when landed' do
#       it 'a plane cannot land if it\'s already at the airport' do 
#         allow(Weather).to receive(:current) { "safe" }
  
#         subject.land(plane_1)
#         expect { subject.land(plane_1) }.to raise_error(Airport::ALREADY_LANDED_ERROR_MESSAGE)
#       end

#       it 'a plane cannot land if it\'s at another airport' do
#         airport = Airport.new
        
#         allow(Weather).to receive(:current) { "safe" }
  
#         subject.land(plane_1)
#         expect { airport.land(plane_1) }.to raise_error(Airport::AIRCRAFT_ELSEWHERE_ERROR_MESSAGE)
#       end

#     end
  
#     context 'when taking off' do 
#       it 'a plane can only takeoff from an airport it\'s in' do 
#         allow(Weather).to receive(:current) { "safe" }
    
#         expect { subject.takeoff(plane_1) }.to raise_error(Airport::AIRCRAFT_NOT_HERE_ERROR_MESSAGE)
#       end
#     end
#   end
# end
