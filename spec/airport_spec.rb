require 'airport'

describe Airport do
  let(:plane) {double :plane}

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

  describe 'Landing a plane' do
    it 'In sunny weather' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      expect(subject.land(plane)).to eq plane
    end

    it 'In stormy weather' do
      allow(subject).to receive(:check_weather) { 'stormy' }
      expect{subject.land(plane)}.to raise_error('Cannot land in stormy weather')
    end
  end

  describe 'Plane taking off' do
    it 'In sunny weather' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'In stormy weather' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(plane)
      allow(subject).to receive(:check_weather) { 'stormy' }
      expect{subject.take_off(plane)}.to raise_error('Cannot take off in stormy weather')
    end
  end

  describe 'Check if plane is in the hanger:' do
    it 'Before it has landed' do
      expect(subject.in_hanger?(plane)).to eq false
    end

    it 'After it has landed' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(plane)
      expect(subject.in_hanger?(plane)).to eq true
    end

    it 'After it has taken off' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.in_hanger?(plane)).to eq false
    end

    it 'After attempting to land in stormy weather' do
      allow(subject).to receive(:check_weather) { 'stormy' }
      subject.land(plane)
      rescue
      expect(subject.in_hanger?(plane)).to eq false
    end

    it 'After attempting to take off in stormy weather' do
      allow(subject).to receive(:check_weather) { 'sunny' }
      subject.land(plane)
      allow(subject).to receive(:check_weather) { 'stormy' }
      subject.take_off(plane)
      rescue
      expect(subject.in_hanger?(plane)).to eq true
    end

  end

end
