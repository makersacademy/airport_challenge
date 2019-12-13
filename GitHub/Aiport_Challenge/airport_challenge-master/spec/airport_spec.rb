# User Stories:
# *I want to instruct a plane to land at an airport
# *I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport
# *I want to prevent landing when the airport is full
# *I would like a default airport capacity that can be overridden as appropriate

require 'airport'

describe Airport.new do

  it 'creates an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of(Airport)
  end

  it 'lands a plane' do
    airport = Airport.new
    expect(airport).to respond_to(:land_plane).with(1).argument
  end

  it 'airport releases plane for take off' do
    airport = Airport.new
    expect(airport).to respond_to(:plane_take_off).with(1).argument
  end

  it 'plane takes off' do
    plane = Plane.new
    subject.land_plane(plane)
    subject.plane_take_off(plane)
    expect(subject.airp).to eq []
  end

  it 'confirm plane is not in airport' do
    airport = Airport.new
    plane = Plane.new
    subject.land_plane(plane)
    subject.plane_take_off(plane)
    expect(subject.confirm_left(plane)).to eq ("plane has taken off")
  end

  # it 'airport capacity' do
  #   airport = Airport.new
  #   expect(subject.capacity).to eq Airport::DEFAULT_CAPACTITY
  # end

 describe 'intialization' do
   subject {Airport.new}
   let(:plane) {Plane.new}
   it 'defaults capacity' do
     described_class::DEFAULT_CAPACTITY.times do
       subject.land_plane(plane)
     end
     expect{ subject.land_plane(plane) }.to raise_error 'Airport Full'
   end
 end
  # 
  # describe '#land_plane' do
  #   it 'raises an error when airport is full'do
  #     Airport::DEFAULT_CAPACTITY.times { subject.land_plane Plane.new }
  #     expect { subject.land_plane Plane.new }.to raise_error 'Airport full'
  #   end
  # end



  # it 'raise error to prevent landing when airport is full' do
  #   airport = Airport.new
  #   expect(subject.capacity.full?).to raise_error("Airport full")
  # end


  # it 'counts planes on ground' do
  #   airport = Airport.new
  #   expect(airport.land_plane).to change(airport.plane_count).by(1)
  # end

  # it { is_expected.to respond_to(:plane) }

end
