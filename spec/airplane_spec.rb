require 'airplane'

describe Plane do

  subject (:airplane) { described_class.new }

  it "reports an airplane's status" do
    plane = airplane
    expect(plane).to respond_to(:current_status)
  end

end
