require 'plane'

describe Plane do
  it 'expects planes not to be flying after landing' do
    subject.land
    expect(subject.flying?).to eq(false)
  end

  it 'expects that planes that are already flying cannot take off' do
    subject.take_off
    expect(subject.flying?).to eq(true)
  end
end
