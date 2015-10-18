require 'airport'

describe Airport do

  it { is_expected.to respond_to :request_landing}
  it { is_expected.to respond_to :request_take_off}

=begin
  subject { Airport.new }
  let(:plane) { double(:plane) }
  it 'does not exceed default capacity' do
    Airport::DEFAULT_CAPACITY.times{subject.request_landing(plane)}
    expect{ subject.request_landing(plane)}.to raise_error 'Airport is full'
  end
=end

  subject { Airport.new }
  let(:plane) { double(:plane) }
  it 'a plane can only take off if it is at that airport' do
    expect{ subject.request_take_off(plane)}.to raise_error 'Plane is not at airport'
  end


  capacity = 20
  subject { Airport.new(capacity) }
  let(:plane) { double(:plane) }
  it 'airport default capacity can be overridden' do
    capacity.times { subject.request_landing(plane) }
    expect {subject.request_landing(plane)}.to raise_error 'Airport is full'
  end

  #allow(die).to receive(:roll) { 3 }
end

