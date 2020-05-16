require 'plane'

describe Plane do
  it { is_expected.to respond_to :land }

  it "#land" do
    airport = subject.land
    expect(subject.land).to eq airport
  end
end
