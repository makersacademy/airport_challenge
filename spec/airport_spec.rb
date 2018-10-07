require 'airport'

describe Airport do  
  let(:plane) { double :plane }
  it "should be able to land planes" do
    expect { subject.land(plane) }.not_to raise_error
  end
end
