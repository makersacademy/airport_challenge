require 'airport'

describe Airport do
  it { is_expected.to respond_to :land }

  it "landed plane in sunny weather" do
    plane = subject.land
    expect(plane).to sunny?
  end
end
