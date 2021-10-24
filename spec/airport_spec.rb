require_relative '../lib/airport'

describe Airport do
  describe '#land' do
    # plane = plane.new
    # subject.land(plane)
      it 'instructs a plane to land at an airport' do
      is_expected.to respond_to :land
      end
  end

  # describe '#take_off' do
  #it 'instructs a plane to take off and send a confirmation message' do
  #git    is_expected.to respond_to :take_off
  # end
  #end
end