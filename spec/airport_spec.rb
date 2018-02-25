require './lib/airport'

describe Airport do

  before(:each) do
    @plane = Plane.new
  end

  it { should respond_to(:landing, :full?, :take_off,) }


  # it { expect(subject.full?).to eq false}
  describe '#landing' do
    it { should respond_to(:landing).with(1).argument }
    # A plane is landing to the airport'
    it "a plane is landing to the airport" do
    expect(subject.landing(@plane).last).to eq @plane
    end
  end

  describe '#take_off' do
    it { should respond_to(:take_off).with(1).argument }
    it " allow plane to leave the airport" do
    subject.landing(@plane)
    expect(subject.take_off(@plane)).to eq @plane
   end
  end
end
