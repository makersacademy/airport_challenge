require 'plane'

describe Plane do
  it 'responds to #touch_down' do
    expect(subject).to respond_to :touch_down
  end

  it 'responds to #lift_off' do
    expect(subject).to respond_to :lift_off
  end

  it 'updates flying? state when landing' do
    subject.touch_down
    expect(subject.flying?).to eq false
  end

  it 'updates flying? state when taking off' do
    subject.lift_off
    expect(subject.flying?).to eq true
  end

end
