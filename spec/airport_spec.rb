require 'airport'

describe Airport do
  it 'exists as a class' do
    expect(described_class).to eq(Airport)
  end

  it { is_expected.to respond_to(:land) }

  it 'accepts one argument to land' do         
    expect { subject.land(1) }.not_to raise_error
  end

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq(plane)
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }
end
