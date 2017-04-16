require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(subject.land(plane)).to eq plane
    end
  end

  it 'prevents landing when airport is full' do
    message = 'Landing denied, airport is full!'
    subject.land(plane)
    expect{ subject.land(plane) }.to raise_error message
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#take_off' do
    it 'instructs a plane to take off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end

end
