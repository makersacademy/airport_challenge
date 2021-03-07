require 'plane'
describe Plane do
  it { is_expected.to respond_to :present? }
  it "is present" do
    expect(subject.present?).to eq true
  end
end
