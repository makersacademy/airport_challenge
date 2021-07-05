require 'airport'

RSpec.describe Airport do

subject(:plane) { described_class.new }

  it { is_expected.to respond_to(:take_off) }

  it { is_expected.to respond_to(:land).with(1).argument }

  context 'returns status of planes' do

    it 'returns airborne plane' do
      subject.take_off(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it 'returns landed plane' do
      subject.land(plane)
      expect(subject.land(plane)).to eq plane
    end
  end

  it "raises error if airport full" do
    subject.capacity.times { subject.land plane }
    expect { subject.land plane }.to raise_error "Airport is full"
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
 
end