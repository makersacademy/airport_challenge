require 'plane'

describe Plane do
  # it 'responds to take_off' do
  #   expect(subject).to respond_to :take_off
  # end
  it { is_expected.to respond_to :flying }
  it { is_expected.to respond_to :landed }


  it 'can be flying' do
    subject.flying
    expect(subject.in_flight).to eq(true)
  end

  it 'checks a landed plane cannot be in flight' do
    subject.landed
    expect(subject.in_flight).to eq(false)
  end

  it 'checks a flying plane cannot be in airport' do
    subject.flying
    expect(subject.in_airport).to eq(false)
  end

  describe '#landed' do
    it 'tests a landed plane cannot be flying' do
      plane = Plane.new
      expect(plane.landed).to_not eq(plane.flying)
    end
  end

end
