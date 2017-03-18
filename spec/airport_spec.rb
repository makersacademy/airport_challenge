require 'airport'

describe Airport do
 let(:plane) { Plane.new }

  describe '#land' do
    it { is_expected.to respond_to(:land) }

    it 'instructs a plane to land at a specific airport and confirm it has landed' do
    expect(subject.land(plane)).to eq true
    end

    it 'adds the landed plane to planes array' do
      expect(subject.add_plane(plane)).to eq [plane]
    end
  end

  describe '#take_off' do
    it 'should take_off and confirm no longer in airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq []
    end
  end

end
