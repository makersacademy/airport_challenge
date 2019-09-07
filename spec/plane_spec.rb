require 'plane'

describe Plane do
  it 'is marked as flying after takeoff' do
    subject.mark_flying
    expect(subject.flying).to eq true
  end
end
