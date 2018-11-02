require 'airport'

describe Airport do
  let(:plane) { double :plane }
  it 'should let a plane land' do
    subject.land(plane)
    expect(subject.planes).to include(plane)
  end

  it "a plane that's taken off is no longer in the airport" do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include(plane)
  end
end
