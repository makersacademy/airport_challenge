require 'plane'

describe Plane do

  it 'responds to in_air?' do
    expect(subject).to respond_to :in_air?
  end

  it 'responds to on_ground?' do
    expect(subject).to respond_to :on_ground?
  end

  it 'expect a plane to be in air' do
    expect(subject.in_air?).to eq true
  end

end