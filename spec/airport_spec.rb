require 'airport'

describe Airport do

  it { is_expected.to respond_to :request_landing}
  it { is_expected.to respond_to :request_take_off}

  subject { Airport.new }
  let(:plane) { double(:plane) }
  it 'does not exceed default capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.request_landing(plane)
    end
    expect{ subject.request_landing(plane) }.to raise_error 'Airport is full'
  end

  subject { Airport.new }
  let(:plane) { double(:plane) }
  it 'A plane can only take off if it is at that airport' do
    expect{ subject.request_take_off(plane)}.to raise_error 'Plane is not at airport'
  end

  "Plane is not at airport"

=begin
  let(:plane) { double(:plane) }
  it 'airport default capacity can be overridden' do
    capacity = 100
    subject { Airport.new (100) }
    capacity.times {subject.plane_has_landed(plane)}
  end
=end

end

