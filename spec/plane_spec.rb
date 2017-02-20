require 'plane'

describe Plane do

  it 'Confirms that plane has landed' do
    subject.land = true
    expect(subject.landed?).to eq true
  end

  it 'Confirms that plane has taken off' do
    subject.land = false
    expect(subject.landed?).to eq false
  end

  it 'Confirms if plane is flying and has not landed yet' do
    subject.flying
    expect(subject.landed?).to eq false
  end
end
