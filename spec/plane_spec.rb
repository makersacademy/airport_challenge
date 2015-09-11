require 'plane'

describe Plane do

  let(:airport) { double:airport }

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  it 'can land' do
    allow(airport).to receive(:weather) { "sunny" }
    is_expected.to respond_to :land
  end
  it 'lands and is not flying' do
    allow(airport).to receive(:land) { subject }
    subject.land
    expect(subject).not_to be_flying
  end

  it 'can take off and is flying after take off' do
    allow(airport).to receive(:weather) { "sunny" }
    allow(airport).to receive(:take_off) { subject }
    is_expected.to respond_to :take_off
    airport.take_off subject
    expect(subject).to be_flying
  end

  it 'takes off and is flying' do
    allow(airport).to receive(:take_off) { subject }
    subject.take_off
    expect(subject).to be_flying
  end

end
