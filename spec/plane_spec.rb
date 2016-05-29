require 'plane'

describe Plane do
  it 'responds to on_ground?' do
  expect(subject).to respond_to :on_ground?
  end

  it 'expect a plane to be on ground' do
    expect(subject.on_ground?).to eq true
  end

end