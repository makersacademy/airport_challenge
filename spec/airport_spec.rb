require 'airport'
require 'plane'

describe Airport do

# User Story: 1
  it { is_expected.to respond_to(:land).with(1).argument }
  describe '#land' do
    it 'allows plane to land' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.land(plane)).to include plane
    end
  end
# User story: 2
  it { is_expected.to respond_to(:take_off) }
  describe '#take_off' do
    it 'allows plane to take off and confirms it has taken off' do
      Plane.new
      expect(subject.take_off).to eq @planes
    end
  end

# User story: 3
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it { is_expected.to respond_to(:full?) }
  describe '#full?' do
    it 'raises an error when airport full' do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.full? }.to raise_error 'airport full, no landing'
    end
  end
  # User story: 5


    # it 'it can be stormy weather' do
    #   airport = Airport.new
    #   subject.stormy
    #   expect{ subject.land(plane) }.to raise_error 'stormy, no landing'
    # end


#User story:4
  describe 'initialization' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'sets capacity' do
      Airport::DEFAULT_CAPACITY.times do
      subject.land(plane)
      end
      expect{ subject.land(plane) }.to raise_error 'airport full, no landing'
    end
  end


end
