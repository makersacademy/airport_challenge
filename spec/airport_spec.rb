require 'airport'

describe Airport do
  let(:p1) {double :plane}
  let(:p2) {double :plane}

  describe 'Can check the weather' do
    it 'Weather is either sunny or stormy' do
      expect(subject.check_weather).to eq('stormy').or eq('sunny')
    end

    it 'Weather is dynamic and randomly generated' do
      srand(1)
      expect(subject.check_weather).to eq "sunny"
      expect(subject.check_weather).to eq "sunny"
      expect(subject.check_weather).to eq "stormy"
      expect(subject.check_weather).to eq "sunny"
      expect(subject.check_weather).to eq "stormy"
    end
  end

  describe 'Can check if full' do
    it 'Returns a boolean' do
      expect(subject.full?).to be(true).or be(false)
    end

    it 'false when not full' do
      expect(subject.full?).to eq false
    end

    it 'true when full' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(p1)
      expect(subject.full?).to eq true
    end
  end

  describe 'Landing a plane' do
    it 'In sunny weather' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      expect(subject.land(p1)).to eq p1
    end

    it 'In stormy weather' do
      allow(subject).to receive(:check_weather) { 'stormy' }
      expect{subject.land(p1)}.to raise_error('Cannot land in stormy weather')
    end

    it 'When full' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(p1)
      expect{subject.land(p2)}.to raise_error('Cannot land. Airport is full.')
    end
  end

  describe 'Plane taking off' do
    it 'In sunny weather' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(p1)
      expect(subject.take_off(p1)).to eq p1
    end

    it 'In stormy weather' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(p1)
      allow(subject).to receive(:check_weather) { 'stormy' }
      expect{subject.take_off(p1)}.to raise_error('Cannot take off in stormy weather')
    end
  end

  describe 'Check if plane is in the hanger:' do
    it 'Returns a boolean' do
      expect(subject.in_hanger?(p1)).to be(true).or be(false)
    end

    it 'Before it has landed' do
      expect(subject.in_hanger?(p1)).to eq false
    end

    it 'After it has landed' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(p1)
      expect(subject.in_hanger?(p1)).to eq true
    end

    it 'After it has taken off' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(p1)
      subject.take_off(p1)
      expect(subject.in_hanger?(p1)).to eq false
    end

    it 'After attempting to land in stormy weather' do
      allow(subject).to receive(:check_weather) { 'stormy' }
      subject.land(p1)
      rescue
      expect(subject.in_hanger?(p1)).to eq false
    end

    it 'After attempting to take off in stormy weather' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(p1)
      allow(subject).to receive(:check_weather) { 'stormy' }
      subject.take_off(p1)
      rescue
      expect(subject.in_hanger?(p1)).to eq true
    end

    it 'After atempting to land when full' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(p1)
      subject.land(p2)
      rescue
      expect(subject.in_hanger?(p1)).to eq true
      expect(subject.in_hanger?(p2)).to eq false
    end
  end

end
