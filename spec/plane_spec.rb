require 'plane'

describe Plane do

  it { is_expected.to respond_to :airborne? }
  it { is_expected.to respond_to :grounded? }
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  it 'is airborne when created' do
    expect(subject).to be_airborne
  end

  # possible refactor: group tests related to a particular method together with a context block

  describe '#land' do

    before do
      subject.land
    end

    context "after landing plane" do
      it { is_expected.to be_grounded }
      it { is_expected.not_to be_airborne }
    end

  end

  describe '#take_off' do

    before do
      subject.take_off
    end

    context "after take off plane" do
      it { is_expected.to be_airborne }
      it { is_expected.not_to be_grounded }
    end

  end

end
