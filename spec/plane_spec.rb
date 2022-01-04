require 'plane'

describe Plane do
  #responds to correct methods
  it { is_expected.to respond_to :airbourne? }

  it { is_expected.to respond_to :landed? }

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to :land }

  #plane is airbourne when created
  it 'is airbourne when created' do
    expect(subject).to be_airbourne
  end
  #airbourne status changes when landing
  it 'is not flying when landed' do
    subject.land
    expect(subject.airbourne?).to eq false
  end
  # airbourne status is correct when flying
  it 'is not landed when flying' do
    subject.land
    subject.take_off
    expect(subject.landed?).to eq false
  end

  describe 'land' do
    #airbourne status changes when landing
    it 'changes status of plane from flying to landed' do
      subject.land
      expect(subject).to be_landed
    end

  end

  describe 'take_off' do
  #airbourne status changes when taking off
    it 'changes status of plane from landed to flying' do
      subject.take_off
      expect(subject).to be_airbourne
    end

  end

end
 
