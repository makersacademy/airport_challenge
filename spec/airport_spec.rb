require 'airport'

describe Airport do

  it 'allows a plane to take off' do
    expect(subject).to respond_to :take_off
  end

  it 'allows a plane to land' do
    expect(subject).to respond_to :land
  end

  it 'accepts an argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  describe Airport.new do
    it { is_expected.to have_attributes(:capacity => Airport::DEFAULT_CAPACITY) }
    it { is_expected.to have_attributes(:planes => []) }
  end
end

