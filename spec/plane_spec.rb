require 'plane'

describe Plane do

  it 'is flying when created' do
    expect(subject.flying).to be true
  end

  it { is_expected.to respond_to(:landed)}

end
