require 'plane'

describe Plane do
  it { is_expected.to respond_to :instructed_to_land}
  it { is_expected.to respond_to :instructed_to_take_off}

  subject { Plane.new }
  it 'A flying plane cannot take off' do
    expect{ subject.instructed_to_take_off }.to raise_error 'Already flying'
  end

  it 'A plane not flying cannot land' do
    subject.instructed_to_land
    expect{ subject.instructed_to_land }.to raise_error 'Not flying'
  end

end

