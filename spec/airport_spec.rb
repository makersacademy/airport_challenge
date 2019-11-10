require 'airport'
require 'plane'
describe Airport do
  subject(:airport) { described_class.new(20) }
  # airport = Airport.new(20)
  plane = Plane.new

  describe '#land' do
    it 'instructs a plane to land' do
      expect(airport).to respond_to(:land).with(1). argument
    end

    it 'doesnot allow plane to land when airport is full' do
      20.times do
       airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error 'Cannot land plane: airport is full'
    end
  end
  describe '#take_off' do
    it 'instructs a plane to take_off' do
     expect(airport).to respond_to(:take_off).with(1). argument
    end
  end
end
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate
#
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
