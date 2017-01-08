require './lib/plane'

describe Plane do
  # from boris bikes: it { is_expected.to respond_to(:release_bike) }
  # it responds to land
  it {is_expected.to respond_to :land}
  it {is_expected.to respond_to :landed?}
  it {is_expected.to respond_to :take_off}
  it {is_expected.to respond_to :departed?}

  describe '#take_off:' do
    context 'when weather is stormy' do
      it 'prevents a Plane object from taking off' do
        allow(subject).to receive(:weather) { "stormy" } #copied from kat's repo
        expect(subject.take_off).to eq false
      end
    end
  end


  describe '#departed?' do
    context 'when Plane object has taken off' do
      it 'provide status of Plane object' do
      expect(subject.departed?).to eq true
      end
    end
  end


  describe '#landing:' do
    context 'when weather is stormy' do
      it 'prevents a Plane object from landing' do
        allow(subject).to receive(:weather) { "stormy" }
        expect(subject.land).to eq false
      end
    end
  end










end
