require './lib/airport'

describe Airport do
  let(:plane) { Plane.new }

  it { is_expected.to be_instance_of(Airport) }
  
  describe '#land' do

    it 'planes can land at an airport' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it 'has a default capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error("There is no space at this airport")
    end

  end

end
