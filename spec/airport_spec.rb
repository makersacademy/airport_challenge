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

    it 'Returns false if the airport is not empty' do
      subject.receive_plane(Plane.new)
      expect(subject.is_empty?).to eq false
    end
  end
  # 
  # describe 'inventory' do
  #   it 'Returns how many planes are at the airport' do
  #     plane = Plane.new
  #     expect(subject.planes_at_airport).to eq 0
  #   end
  # end



end
