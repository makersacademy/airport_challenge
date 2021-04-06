require 'airport'

describe Airport do
  it { is_expected.to respond_to :take_off }
  
  it { is_expected.to respond_to(:land).with(1).argument }
  
  it 'lands the plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  it 'raises an error when airport is full' do
    subject.capacity.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error 'Airport is full'
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{ subject.land(plane) }.to raise_error 'Airport is full'
    end
  end

end
