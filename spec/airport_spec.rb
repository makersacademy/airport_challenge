require "airport"

describe Airport do

  describe '#take_off' do
    it 'Checks whether plane has taken off and left airport' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq true
    end
  end

  describe '#empty?' do
    it 'Returns true if the airport is empty' do
      expect(subject.is_empty?).to eq true
    end
  end



end
