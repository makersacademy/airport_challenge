require 'airport'

describe Airport do
  it 'exists as a class' do
    expect(described_class).to eq(Airport)
  end

  it { is_expected.to respond_to(:land) }

  it 'accepts one argument to land' do         
    expect { subject.land(1) }.not_to raise_error
  end
end
