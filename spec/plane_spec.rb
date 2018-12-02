require 'plane'

describe Plane do
  it 'is flying by default' do
    expect(subject.flying).to eq true
  end

  it 'stops flying' do
    subject.stop_flying
    expect(subject.flying).to eq false
  end

  it 'starts flying' do
    subject.start_flying
    expect(subject.flying).to eq true
  end
end
