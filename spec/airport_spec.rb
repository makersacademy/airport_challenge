require "airport"

describe Airport do
  it { is_expected.to respond_to :landing}
  it { is_expected.to respond_to :takeoff}



  describe '#landing' do
    it 'raises an error when full' do
      # puts subject.capacity.times
      subject.capacity.times {subject.landing double :plane}
      # subject.landing double(:plane)
      expect { subject.landing double(:plane) }.to raise_error 'airport full'
    end
    end
end

#describe '#takeoff' do

#  it 'returns planes' do
#    planes = Plane.new
#    expect { subject.takeoff }.to eq 'Yes'
#  end

#   it 'has a default capacity' do
#   expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
# end
