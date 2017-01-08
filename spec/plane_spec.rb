require 'Plane'
require 'Airport'

describe Plane do

  #let(:plane) { double :plane }

it 'controller can instruct a plane to land' do
      expect(Plane.new).to respond_to :land
  end

it 'controller can instruct plane to take off' do
    expect(Plane.new).to respond_to :takeoff
end

# it ' a new plane instance '
#
 it 'controller can confirm plane is mid air' do
   plane1 = Plane.new
   expect(plane1.landed). to eq false
 end

 # it 'controller can confirm plane is landed' do
 #   plane2 = Plane.new
 #   ema = Airport.new
 #   ema.land_plane(plane2)
 #   expect(plane2.landed).to eq true
 # end


# it 'plane takeoff will error if plane is already in air' do
#   #bike = double(:bike)
#   allow(plane).to receive(:landed).and_return(true)
#   #bike.report_broken
#   subject.takeoff(plane)
#   expect {subject.takeoff}.to raise_error(Runtimeerror) 'Plane is mid air'
# end
end
