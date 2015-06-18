require 'plane'

describe Plane do

  let(:plane) { Plane.new } # consider having a let block rather than using subject (just my personal opinion)

  it 'is flying when created' do
    expect(plane).to be_flying
  end

  describe '#land' do

    it 'can land' do
      expect(subject).to respond_to :land
    end

    it 'cannot land if already landed' do
      subject.land
      expect { subject.land }.to raise_error 'Plane has already landed'
    end

    it 'is landed after landing' do
      subject.land
      expect(subject).to be_landed
    end

  end

  # same with take off, nest in describe block
  it 'can take off' do
    expect(subject).to respond_to :take_off
  end

  it 'cannot take off if already flying' do
    expect { subject.take_off }.to raise_error
    'Plane cannot take off when flying'
  end

  it 'is flying after take off' do
    subject.land
    expect(subject.take_off).to be_flying
  end

  it 'cannot be both flying and landed' do
    expect(subject.flying?).not_to eq subject.landed?
  end
end
