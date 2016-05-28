require 'airport'

describe Airport do

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
  end

  # describe '#land_plane' do
  #   it 'raise error if plane has already landed' do
  #   end
  #
  #   it 'raise error if weather is stormy' do
  #   end
  #
  #   it 'raise error if airport is full' do
  #   end
  #
  #   it 'lands a plane' do
  #   end
  # end

    # describe '#take_off_plane' do
    #   it 'raise error if plane has already taken off' do
    #   end
    #
    #   it 'raise error if weather is stormy' do
    #   end
    #
    #   it 'takes off a plane' do
    #   end
    # end
end
