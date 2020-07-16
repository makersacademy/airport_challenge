require 'airport.rb'

# RSpec.configure do |config|
#   config.mock_with :rspec # use rspec-mocks
# end

describe Airport do
  # describe initialize do
  #   it 'creates an instance of airport' do
  #     # airport = Airport.new
  #     expect(airport).to be_an_instance_of Airport
  #   end
  # end
  describe '#land' do
    it 'instructs a plane to land' do
      airport = Airport.new
      plane = Plane.new
      expect(airport.land(plane)).to eq [plane]
    end
  end

  describe '#land not allowed' do
    it 'raise an error if full of planes' do
      Airport::DEFAULT_CAPACITY.times do
      subject.land Plane.new
      end
      expect {subject.land Plane.new}.to raise_error 'No landing allowed. Airport is full.'
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      airport = Airport.new
      expect(airport.take_off).to eq 'Take off allowed, plane no longer in this airport!'
    end
  end

end

# describe 'Weather' do
#
#   describe "#landing during stormy weather" do
#         # let(:response) { get "/members/Anja" }
#     it "prevent planes to land in stormy weather" do
#       weather = Weather.new
#
#       allow(weather).to receive(:stormy?).and_return(true)
#       expect(airport.new.land).to raise_error 'Landing not allowed due to storm.'
#       end
#     end
# end
