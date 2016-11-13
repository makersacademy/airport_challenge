require 'plane'

describe Plane do

  it 'check that an airplane exists?' do
    expect(subject).to eq subject
  end
  it 'checks that a specific plane is not landed' do
    expect(subject.landed).to be false
  end

end
