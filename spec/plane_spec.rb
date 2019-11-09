require 'plane'

describe Plane do

  let(:testairport) { double :Airport }

  it { is_expected.to be_instance_of(Plane) }

  it 'is initialized as landed' do
    expect(subject.status).to eq("landed")
  end

end
