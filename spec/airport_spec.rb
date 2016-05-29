require 'airport'

describe Airport do

  let(:landed_plane) {double(:landed_plane, landed?: true)}
  let(:flying_plane) {double(:flying_plane, landed?: false)}


  describe 'attributes:' do
    it { is_expected.to have_attributes(planes: []) }
    it { is_expected.to have_attributes(capacity: Airport::DEFAULT_CAPACITY) }
  end

  it 'responds to land a plane' do
    expect(subject).to respond_to(:land_plane).with(1).arguments
  end

  it 'responds to take off a palne' do
    expect(subject).to respond_to(:take_off_plane).with(1).arguments
  end

# NOW PRIVATE
# it 'responds to full airport' do
#   expect(subject).to respond_to :full?
# end

# NOW PRIVATE
#  it 'responds to empty airport' do
#    expect(subject).to respond_to :empty?
#  end

  describe '#land_plane' do
    it 'lands a plane' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      subject.land_plane(flying_plane)
      expect(subject.planes[-1]).to eq flying_plane
    end

    it 'return confimation message once landed' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      expect(subject.land_plane(flying_plane)).to eq 'The plane has landed!'
    end

    it 'raises error if airport is full' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      Airport::DEFAULT_CAPACITY.times {subject.land_plane(flying_plane)}
      expect {subject.land_plane(flying_plane)}.to raise_error 'The airport is full!'
    end

    it 'raises error if weather is stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      expect{subject.land_plane(flying_plane)}.to raise_error 'Land Denied: Storm!'
    end
  end


  describe '#take_off_plane' do
    it 'takes off plane' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      subject.planes << landed_plane
      subject.take_off_plane(landed_plane)
      expect(subject.planes).to eq []
    end

    it 'returns confirmation message once taken off' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      subject.planes << landed_plane
      expect(subject.take_off_plane(landed_plane)).to eq 'The plane has taken off!'
    end

    it "raises error if the airport is empty" do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      expect{subject.take_off_plane(landed_plane)}.to raise_error 'The airport is empty!'
    end

    it 'raises error if plane has already taken off' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
      expect{subject.take_off_plane(flying_plane)}.to raise_error 'This plane has already taken off!'
    end

    it 'raises error if weather is stormy' do
      allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
      subject.planes << landed_plane
      expect{subject.take_off_plane(landed_plane)}.to raise_error 'Take off Denied: Storm!'
    end
  end
end
