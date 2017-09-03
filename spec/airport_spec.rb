require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }

  it 'allows landing' do
    plane = subject.land
    expect(plane).to be_safe_to_fly?
  end
end
