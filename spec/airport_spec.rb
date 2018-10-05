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


end
