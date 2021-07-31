require 'plane'
require 'airport'

describe Plane do

  it 'is flying' do
    expect(subject.flying?).to be true
  end

end
