require 'airport'

describe Airport do
  let(:plane) {double :plane}
  it 'A plane can land' do
    expect(subject.land(plane)).to eq plane
  end

  it 'A plane can take off' do
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  describe 'Check if plane is in the hanger:' do
    it 'before it has landed' do
      expect(subject.in_hanger?(plane)).to eq false
    end

    it 'after it has landed' do
      subject.land(plane)
      expect(subject.in_hanger?(plane)).to eq true
    end

    it 'after it has taken off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.in_hanger?(plane)).to eq false
    end
  end

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

end
