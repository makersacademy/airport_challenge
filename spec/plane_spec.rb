require 'plane.rb'

describe Plane do

  # airport = Airport.new
  let(:airport) {double :airport, landing: :false, taking_off: :true}

  it {is_expected.to respond_to :land }
  it {is_expected.to respond_to :take_off}

  it 'is expected to be flying when created' do
    expect(subject.flying).to eq(true)
  end

  it 'is expected that flying eq false if land' do
    subject.land
    expect(subject.flying).to eq(false)
  end

  it 'is expected that flying eq true if take off' do
    subject.take_off
    expect(subject.flying).to eq(true)
  end


end
