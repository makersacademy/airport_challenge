require 'plane'

describe Plane do
  it 'checks if plane is flying' do
    expect(subject.flying?).to eq(true)
  end
end
