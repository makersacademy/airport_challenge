take_off_clearance
landing_clearance



it 'instructs a plane to take off' do
      expect(subject).to respond_to(:request_take_off)
    end


def request_take_off
      take_off #the other method for taking off
end


def request_landing plane
      land_plane plane
    end
  end







  it 'instructs a plane to land' do
      expect(subject).to respond_to(:request_landing).with(1).argument
    end




In IRB:
subject.take_off_clearance(plane)
# will fail

#Create a Runway array to store planes cleared for take off
#Create incoming array for flight coming in to land.

it "instructs plane to take off" do
	subject.take_off_clearance(plane)
	expect(subject).to respond_to :take_off_clearance
end

attr_reader :runway

def initialize
	@runway = runway
end

def take_off_clearance
	plane.take_off_clearance
	@runway << plane
end


