require 'plane'

describe Plane do
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :take_off}

  let(:airport) { double(:airport) }
  subject { Plane.new }
  it 'A plane not flying cannot land' do
    allow(airport).to receive(:request_landing).with(subject)
    subject.land(airport)
    expect{ subject.land(airport)}.to raise_error 'Not flying'
    expect( subject.airport).not_to be_nil
  end

  let(:airport) { double(:airport) }
  subject { Plane.new }
  it 'A flying plane cannot take off' do
    allow(airport).to receive(:request_take_off).with(subject)
    expect{ subject.take_off(airport) }.to raise_error 'Already flying'
    expect( subject.airport ).to be_nil
  end

  let(:airport) { double(:airport) }
  let(:airport2) { double(:airport) }
  subject { Plane.new }
  it 'A plane can only take off from airport they are at' do
    allow(airport).to receive(:request_landing).with(subject)
    subject.land(airport)
    allow(airport2).to receive(:request_take_off).with(subject)
    expect{subject.take_off(airport2) }.to raise_error 'Plane cannot take off from requested airport'
  end
end

