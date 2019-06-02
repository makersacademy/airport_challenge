require 'plane'
require 'airport'

describe Plane do

  it 'should be initialised with a state of being not at the airport' do
    expect(subject.instance_variable_get(:@at_airport)).to be false
  end

  # it 'when it is clear for landing the plane can land' do
  #   airport = object_double(Airport.new)
  #   allow(airport).to receive(:clear_for_landing?).and_return(true)
  #   subject.land(airport)
  #   expect(subject).to be_at_airport
  # end

  # it 'when it is not clear for landing the plane cannot land' do
  #   airport = object_double(Airport.new)
  #   allow(airport).to receive(:clear_for_landing?).and_return(false)
  #   subject.land(airport)
  #   expect(subject).not_to be_at_airport
  # end

  # it 'when it is clear for take off the plane will leave airport' do
  #   airport = object_double(Airport.new)
  #   allow(airport).to receive(:clear_for_take_off?).and_return(true)
  #   subject.take_off(airport)
  #   expect(subject).not_to be_at_airport
  # end

  # it 'when it is not clear for take off the plane will not leave airport' do
  #   airport = object_double(Airport.new)
  #   allow(airport).to receive(:clear_for_take_off?).and_return(false)
  #   subject.take_off(airport)
  #   expect(subject).to be_at_airport
  # end

end