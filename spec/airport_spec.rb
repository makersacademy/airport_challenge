require 'airport'

describe Airport do
  context 'Testing available methods on the Airport class' do
    it 'should be able to call take_off' do
      # purpose: result.
      expect(Airport.new).to respond_to(:take_off)
    end
    it 'should be able to call land_plane' do
      # purpose: result.
      expect(Airport.new).to respond_to(:land_plane)
    end
    it 'should be created with an existing instance variable @hangar' do
      # purpose: result.
      heathrow = Airport.new
      expect(heathrow::hangar).to be_empty
    end
    # it 'should be able to check what is in hangar' do
    #   #purpose: method call
    #   expect
    # end

  end
end
