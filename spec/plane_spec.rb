require 'plane'

describe Plane do

  it 'should repond to flying?' do
    expect(subject).to respond_to(:flying?)
  end

  it 'should return true' do
    expect(subject.flying?).to eq(true)
  end

end
