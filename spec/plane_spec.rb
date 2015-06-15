require 'plane'

describe Plane do

  it { is_expected.to respond_to :flying? }

  it { is_expected.to respond_to :landed? }

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to :land }

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  it 'is not flying when landed' do
    subject.land
    expect(subject.flying?).to eq false
  end

  it 'is not landed when flying' do
    subject.land
    subject.take_off
    expect(subject.landed?).to eq false
  end

  describe 'land' do

    it 'changes status of plane from flying to landed' do
      subject.land
      expect(subject).to be_landed
    end

  end

  describe 'take_off' do

    it 'changes status of plane from landed to flying' do
      subject.take_off
      expect(subject).to be_flying
    end

  end

end
