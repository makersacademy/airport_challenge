require 'plane'

RSpec.describe Plane do

  it 'can land' do
    expect(subject.land).to eq(true)
  end
end
