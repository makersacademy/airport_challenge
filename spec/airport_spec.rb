require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  it 'confirms plane is flying' do
    plane = subject.take_off
    expect(plane).to be_flying
  end

end
