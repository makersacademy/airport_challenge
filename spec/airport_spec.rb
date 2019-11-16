require './lib/airport'

describe Airport do

  #check that airport is an instance of the Airport class
  describe airport do
    # it "should be an instance of Airport" do
    #   airport = Airport.new
    #   expect(airport).to be_instance_of(Airport)
    # end

    it {is_expected.to be_instance_of(Airport)}
  end

  #next

end
