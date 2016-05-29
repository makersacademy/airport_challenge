require 'plane'

describe Plane do
  

  describe 'attributes:' do
    it { is_expected.to have_attributes(landed: true) }
  end

  it 'responds to landed?' do
    expect(subject).to respond_to :landed?
  end

  it 'responds to take off' do
    expect(subject).to respond_to :take_off
  end


  describe '#landed?' do
    it 'expect plane to be landed' do
      expect(subject.landed?).to eq true
    end
  end

  describe '#take_off' do
    it 'expect plane to be flying' do
      subject.take_off
      expect(subject.landed?).to eq false
    end
  end

end
