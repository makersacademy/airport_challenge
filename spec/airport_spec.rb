require "airport"

describe Airport do
  let(:plane) {:plane}

  describe '#land_plane' do

      it 'should take a plane and add it to the hangar' do
        expect(subject.land(plane)).to eq [plane]
      end

      it 'has plane in hangar after landing' do
        subject.land(plane)
        expect(subject.hangar).to include plane
      end

  end

  describe '#take_off_plane' do

    it 'should take off a plane and remove it from hangar' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "#{plane} has taken off"
    end

  end

  describe '#weather' do

    it { is_expected.to respond_to(:weather)}
  end

end
