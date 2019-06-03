require 'airport'

RSpec.describe Airport do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to :weather }

  it 'a plane can takeoff' do
    airport = Airport.new
    airport.takeoff
    expect(@hanger).to be_empty
  end

  it 'stops takeoff if weather is stormy' do
    airport = Airport.new
    expect { airport.takeoff }.to raise_error "stop"
  end

  it 'a plane can land' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(@hanger).to include(plane)
  end

  it 'stops landing if weather is stormy' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.to raise_error "stop"
  end
end

#  it 'a plane can land' do
#    airport = Airport.new
#    plane = Plane.new
#    airport.land(plane)
#    expect(@landed).to_not be_empty
#  end

#  it 'a plane can takeoff' do
#    airport = Airport.new
#    plane = Plane.new
#    airport.takeoff(plane)
#    expect(@landed).to be_empty
#  end
