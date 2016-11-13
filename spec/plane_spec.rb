require 'plane'

describe Plane do

  it {is_expected.to respond_to :flying}

  it 'should show that a plane is flying' do
    expect(subject.flying).to eq true
  end

end
