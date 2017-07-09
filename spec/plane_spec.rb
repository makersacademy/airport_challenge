require 'plane'

describe Plane do

  it 'responds to  landed?' do
    expect(subject).to respond_to :landed?
  end

  it 'confirms  takeoff?' do
    expect(subject.took_off?).to eq (true)
  end




end
