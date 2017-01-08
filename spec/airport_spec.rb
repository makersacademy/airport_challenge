require 'plane'
require 'airport'

describe Airport do

end

=begin
  describe '#instruct_landing' do
    it 'prevents plane landing in stormy weather' do
      airport = Airport.new
      plane = Plane.new
      airport.instruct_takeoff(plane)
      expect(plane::landed).to eq(false)
    end
  end
=end

=begin
ATC
Stormy weather | Prevent takeoff

ATC
Stormy weather | prevent landing

=end
