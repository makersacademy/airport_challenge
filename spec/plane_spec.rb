require 'plane'

describe Plane do
  it 'expects planes not to be flying after landing' do
    subject.land
    expect(subject.flying?).to eq(false)
  end
end