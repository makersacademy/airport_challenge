require 'airport'

describe Airport do
  it { is_expected.to respond_to :plane_has_landed}
  it { is_expected.to respond_to :plane_has_taken_off}

  subject { Airport.new }
  let(:plane) { double(:plane) }
  it 'does not exceed default capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.plane_has_landed(plane)
    end
    expect{ subject.plane_has_landed(plane) }.to raise_error 'Airport is full'
  end

=begin
  let(:plane) { double(:plane) }
  it 'airport default capacity can be overridden' do
    capacity = 100
    subject {Airport.new(100)}
    #p "capacity = " subject.capacity
    capacity.times do |i|
      subject.plane_has_landed(plane)
    end
    #expect(subject.capacity).to eq capacity
  end
=end

end

