require 'airport'
require 'plane'

describe Airport do
  it 'successfully instantiates' do
    expect(subject).to be_instance_of(Airport)
  end
  # successful airport.is_empty == true
  it 'starts empty' do
    expect(subject).to be_empty
  end

  describe '#take_in_plane' do
    it 'responds to #take_in_plane' do
      expect(subject).to respond_to(:take_in_plane)
    end

    it 'when plane lands, is no longer empty' do
      test_plane = Plane.new#.land
      subject.take_in_plane(test_plane)
      expect(subject).not_to be_empty
    end

    it 'disallows landing if stormy' do
      test_plane = Plane.new#.land
      subject.sudden_bad_weather
      expect { subject.take_in_plane(test_plane) }.to raise_error('stormy conditions')
    end

    it 'when capacity is 1, landing a second plane fails' do
      first_plane = Plane.new
      second_plane = Plane.new
      subject.take_in_plane(first_plane)
      # errors need { block } syntax
      expect { subject.take_in_plane(second_plane) }.to raise_error 'full'
    end

    it 'cannot allow the same plane to simultaneously dock twice in one airport' do
      x = Airport.new(2)
      test_plane = Plane.new
      x.take_in_plane(test_plane)
      expect { x.take_in_plane(test_plane) }.to raise_error 'DOCKED ALREADY'
    end

    it 'cannot allow self to take in a plane currently docked in another airport' do
      test_plane = Plane.new
      a1 = Airport.new
      a2 = Airport.new
      a1.take_in_plane(test_plane)
      expect {a2.take_in_plane(test_plane) }.to raise_error 'DOCKED ALREADY'
    end

  end

  describe '#part_with_plane_at_pos' do

    it 'responds to #part_with_plane_at_pos' do
      expect(subject).to respond_to(:part_with_plane_at_pos)
    end

    it 'takes in plane, then parts with it' do
      test_plane = Plane.new
      subject.take_in_plane(test_plane)
      subject.part_with_plane_at_pos(0)
      expect(subject.hangar).not_to include(test_plane)
    end

    it 'prevents departure if @weather becomes stormy' do
      test_plane = Plane.new
      subject.take_in_plane(test_plane)
      subject.sudden_bad_weather
      expect { subject.part_with_plane_at_pos(0) }.to raise_error('stormy conditions')
    end
  end

  ## old code to test weather.
  ## improve weather logic as a stretch goal.
  # describe '#local_weather' do
  #
  #   it 'evaluates to stormy or fair' do
  #     expect(subject.weather).to eq('stormy').or eq('fair')
  #   end
  #
  #   # uncertain on syntax to test *here* whether
  #   # weather is 50/50 stormy/fair
  # end
end
