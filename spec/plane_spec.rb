require 'plane'

describe Plane do

  it 'checks if plane can fly' do
    expect(subject.in_air?).to eq(true)
  end

  it 'checks for plane status through received parameters' do
    expect(subject.in_air?(true)).to eq(true)
    expect(subject.in_air?(false)).to eq(false)
  end

end
