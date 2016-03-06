require 'airplane'

describe Plane do

  subject (:plane) { described_class.new }
  let(:plane1) { double(:Plane, status: nil, inflight: nil, landed: nil) }

  it "reports an airplane's status" do
    plane1 = plane
    expect(plane1).to respond_to(:current_status)
  end

end
