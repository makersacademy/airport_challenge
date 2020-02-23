require 'plane'

describe Plane do

  it { is_expected.to respond_to :plane? }

  it 'instance of Plane class' do
    expect(subject.plane?).to eq true
  end

end
