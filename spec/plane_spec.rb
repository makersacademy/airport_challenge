require 'plane'

describe Plane do
    it 'no error from Plane class' do
        plane = Plane.new("air")
        expect{plane}.not_to raise_error
    end
end