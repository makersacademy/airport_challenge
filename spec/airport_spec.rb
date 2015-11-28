require 'airport'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'tells the controller that the plane has landed' do
      plane = double(:plane)
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#planes' do
    it { is_expected.to respond_to(:planes) }
    it 'should return an array with the planes that have landed' do
      planes_array = []
      2.times do
         plane = double(:plane); planes_array << plane; subject.land(plane)
      end
      expect(subject.planes).to match_array(planes_array)
    end
  end

end
