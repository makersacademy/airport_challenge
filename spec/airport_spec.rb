require 'airport'

describe Airport do

  let(:landed_plane) {double(:landed_plane, landed?: true)}
  let(:flying_plane) {double(:flying_plane, landed?: false)}

  describe 'attributes:' do
    it { is_expected.to have_attributes(planes: []) }
    it { is_expected.to have_attributes(capacity: Airport::DEFAULT_CAPACITY) }
  end

  describe 'responds to:' do
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
  end

  describe '#land_plane' do
    it 'lands a plane' do
      subject.land_plane(flying_plane)
      expect(subject.planes[-1]).to eq flying_plane
    end

    it 'return confimation message once landed' do
      expect(subject.land_plane(flying_plane)).to eq 'The plane has landed!'
    end

    it 'raise error if airport is full' do
      Airport::DEFAULT_CAPACITY.times {subject.land_plane(flying_plane)}
      expect {subject.land_plane(flying_plane)}.to raise_error 'The airport is full!'
    end

    it 'raise error if plane has already landed' do
      expect{subject.land_plane(landed_plane)}.to raise_error 'This plane has already landed!'
    end

  #   it 'raise error if weather is stormy' do
  #   end
  end

  describe '#take_off_plane' do

    it 'takes off plane' do
      subject.planes << landed_plane
      subject.take_off_plane(landed_plane)
      expect(subject.planes).to eq []
    end

    it 'returns confirmation message once taken off' do
      subject.planes << landed_plane
      expect(subject.take_off_plane(landed_plane)).to eq 'The plane has taken off!'
    end

    it "raise error if the airport is empty" do
      expect{subject.take_off_plane(landed_plane)}.to raise_error 'The airport is empty!'
    end

    it 'raise error if plane has already taken off' do
      expect{subject.take_off_plane(flying_plane)}.to raise_error 'This plane has already taken off!'
    end

  #   it 'raise error if weather is stormy' do
  #   end
  end
end
