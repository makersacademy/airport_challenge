require 'plane'

describe Plane do

  it 'Checks that an airplane exists?' do
    expect(subject).to eq subject
  end
  it 'Checks that the plane is not landed' do
    expect(subject.landed).to be false
  end

end
