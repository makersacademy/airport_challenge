require 'airport'

describe Airport do

  let(:plane) { double :plane }

  before(:each) do
    subject.stub(:stormy?) { false }
  end

  it 'instructs a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'receives a plane' do
    subject.land plane
    expect(subject.landing_strip.count).to eq(1)
  end

  it 'instructs a plane to take off' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it 'releases a plane' do
    subject.take_off plane
    expect(subject.landing_strip.count).to eq(0)
  end

  context 'when airport is full' do
    it 'does not allow a plane to land' do
      subject.capacity.times { subject.land plane }
      expect{ subject.land plane }.to raise_error "Conditions are not right for landing"
    end
  end

  context 'when weather conditions are stormy' do
    it 'does not allow a plane to take off' do
      subject.land plane
      subject.stub(:stormy?) { true }
      subject.take_off(plane)
      expect(subject.landing_strip.count).to eq(1)
    end

    it 'does not allow a plane to land' do
      subject.stub(:stormy?) { true }
      expect{ subject.land plane }.to raise_error "Conditions are not right for landing"
    end
  end
end
