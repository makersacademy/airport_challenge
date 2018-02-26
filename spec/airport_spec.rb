require './lib/airport'

describe Airport do

  before(:each) do
    @plane = Plane.new
    @sunny = double(:sunny, storm?: true)
    @storm = double(:storm, storm?: false)
    # @plane_1 = double(:plane)
    # @plane_2 = double(:plane)
  end

  it { should respond_to(:full?) }

  describe '#full?' do
    it 'not allow plane to landing if hangar is full' do
      Airport::CAPACITY.times{subject.landing(@plane, @sunny.storm?)}
      expect{subject.landing(@plane, @sunny.storm?)}.to raise_error "landing denied, hangar is full!"
    end
  end

  # it { expect(subject.full?).to eq false}
  describe '#landing' do
    it { should respond_to(:landing).with(2).argument }
    # A plane is landing to the airport'
    it "a plane is landing to the airport" do
    expect(subject.landing(@plane, @sunny.storm?).last).to eq @plane
    end
    it 'raise an error if a plane is try landing with bad weather condition' do
      expect { subject.landing(@plane, @storm.storm?) }.to raise_error "--BAD WEATHER CONDITION-- landing not possible"
    end
  end

  # describe '#take_off' do
  #   it { should respond_to(:take_off).with(2).argument }
  #   it " allow plane to leave the airport" do
  #   subject.landing(@plane)
  #   expect(subject.take_off(@plane, @sunny.storm?)).to eq "#{@plane}" + 'A plane left the hangar!'
  #  end
  # end
end
