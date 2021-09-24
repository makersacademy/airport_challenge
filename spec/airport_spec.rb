require 'airport'

describe Airport do
  it { is_expected.to respond_to :instruct }

  it 'instructs a plane to land' do
    plane = subject.instruct
    expect(plane).to be_landing
  end
end