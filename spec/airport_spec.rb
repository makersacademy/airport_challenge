require './lib/airport'

describe Airport do

  before(:each) do
    @plane = Plane.new
    sunny = double(:sunny, storm?: false)
    storm = double(:storm, storm?: true)
    # @plane_1 = double(:plane)
    # @plane_2 = double(:plane)
    @airport_1 = Airport.new(10, sunny)
    @airport_2 = Airport.new(10, storm)
  end

  it { should respond_to(:full?) }
  describe '#landing' do
    it { should respond_to(:landing).with(1).argument }
    # A plane is landing to the airport'
    it "a plane is landing to the airport" do
    expect(@airport_1.landing(@plane).last).to eq @plane
    end
    it 'raise an error if a plane tryes to land with bad weather condition' do
      expect{@airport_2.landing(@plane)}.to raise_error "--BAD WEATHER CONDITION-- landing not possible"
    end
    it 'not allow plane to landing if hangar is full' do
      Airport::CAPACITY.times{@airport_1.landing(@plane)}
      expect{@airport_1.landing(@plane)}.to raise_error "landing denied, hangar is full!"
    end
   end

   describe '#take_off' do
    it { should respond_to(:take_off).with(1).argument }
    it " allow plane to leave the airport" do
    @airport_1.landing(@plane)
    expect(@airport_1.take_off(@plane)).to eq "#{@plane}" + 'A plane left the hangar!'
   end
   it "raise an error if plale try to take_off with bad weather condition" do
     expect{@airport_2.take_off(@plane)}.to raise_error "--BAD WEATHER CONDITION-- take_off is not possible"
   end
 end
end
