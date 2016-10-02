require 'plane'

describe Plane do

  it {is_expected.to respond_to :landed?}

  describe 'initialization' do
    it 'defaults to a flying plane' do
      expect(described_class.new.landed?).to eq false
    end
  end

  it 'can be marked as landed' do
    subject.confirm_land
    expect(subject.landed?).to eq true
  end

  it 'can be confirmed as taken off' do
    subject.confirm_takeoff
    expect(subject.landed?).to eq false
  end

end
