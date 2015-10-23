require 'plane'

describe Plane do

  it {is_expected.to respond_to(:flying)}

  it 'shows the plane as flying after taking off' do
    expect(subject.taking_off).to eq(subject.flying)
  end

  it 'shows when the plane is landed' do
    expect(subject.landing).to eq(subject.flying)
  end

end
