require_relative '../lib/airport'

describe Airport do
  describe '#land' do
    it 'instructs a plane to land at an airport' do
      plane = Plane.new
     expect(subject.land(plane)).to eq plane
      end

    it {is_expected.to respond_to :land}
  end

  # describe '#take_off' do
  #it 'instructs a plane to take off and send a confirmation message' do
  #git    is_expected.to respond_to :take_off
  # end
  #end
end