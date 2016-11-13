require "airport"

describe Airport do

  describe '#take_off' do
    plane = Plane.new
    it 'Checks whether plane has taken off and left airport' do
      expect(subject.take_off(plane)).to eq true
    end
  end
end
