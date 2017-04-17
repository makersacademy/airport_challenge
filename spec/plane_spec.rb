require 'plane'

describe Plane do
  it {is_expected.to respond_to('fly')}

  it 'is able to land' do
    expect(subject.land).to be false
  end

  it 'is able to take-off' do
    expect(subject.take_off).to be true
  end
end
