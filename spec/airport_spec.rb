require 'airport'
require 'plane'

describe Airport do
  it 'successfully instantiates' do
    expect(subject).to be_instance_of(Airport)
  end

  it 'starts empty' do
    expect(subject).to be_empty
  end

  describe '#take_in_plane' do
    it 'responds to #take_in_plane' do
      expect(subject).to respond_to(:take_in_plane)
    end

    it 'when plane lands, is no longer empty' do
      test_plane = Plane.new
      subject.weather = 'fair' # HIJACK WEATHER: FAIR
      subject.take_in_plane(test_plane)
      expect(subject).not_to be_empty
    end

    it 'disallows landing if stormy' do
      # I just couldn't get this working!
      # allow(subject).to receive(:randomise_weather) {@weather = 'stormy'}
      subject.weather = 'stormy'
      expect { subject.take_in_plane(Plane.new) }.to raise_error 'stormy conditions'
    end

    it 'when capacity is 1, landing a second plane fails' do
      first_plane = Plane.new
      subject.weather = 'fair'
      subject.take_in_plane(first_plane)
      expect { subject.take_in_plane(Plane.new) }.to raise_error 'full'
    end

    it 'cannot allow the same plane to simultaneously dock twice in one airport' do
      bigger_airport = Airport.new(2) #capacity of 2
      test_plane = Plane.new
      bigger_airport.weather = 'fair'
      bigger_airport.take_in_plane(test_plane)
      expect { bigger_airport.take_in_plane(test_plane) }.to raise_error 'DOCKED ALREADY'
    end

    it 'cannot allow self to take in a plane currently docked in another airport' do
      test_plane = Plane.new
      airport_1 = Airport.new
      airport_1.weather = 'fair' # HIJACK WEATHER: FAIR
      airport_2 = Airport.new
      airport_2.weather = 'fair' # HIJACK WEATHER: FAIR
      airport_1.take_in_plane(test_plane)
      expect {airport_2.take_in_plane(test_plane) }.to raise_error 'DOCKED ALREADY'
    end

  end

  describe '#part_with_plane_at_pos' do

    it 'responds to #part_with_plane_at_pos' do
      subject.weather = 'fair'
      expect(subject).to respond_to(:part_with_plane_at_pos)
    end

    it 'takes in plane, then parts with it' do
      test_plane = Plane.new
      subject.weather = 'fair'  # HIJACK WEATHER: FAIR
      subject.take_in_plane(test_plane)
      subject.part_with_plane_at_pos(0)
      expect(subject.hangar).not_to include(test_plane)
    end

    it 'prevents departure if @weather turns stormy' do
      test_plane = Plane.new
      subject.weather = 'fair'
      subject.take_in_plane(test_plane)
      subject.weather = 'stormy'
      expect { subject.part_with_plane_at_pos(0) }.to raise_error('stormy conditions')
    end
  end

end

# TODO:
# replace random weather override with a test stub.
# I tried this but struggled with syntax.

# corrections appreciated!ßß
# allow(subject).to receive(:randomise_weather) {@weather = 'stormy'}
