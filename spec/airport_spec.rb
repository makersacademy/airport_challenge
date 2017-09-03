require 'airport'

describe Airport do
  it { is_expected.to respond_to :fly }

  it 'allows landing' do
    plane = subject.fly
    expect(plane).to be_safe_to_fly?
  end
end
