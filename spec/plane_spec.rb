require 'plane'

# my first test - does plane create a class
describe Plane do
    it 'checks if plane exists' do
        expect(subject).to be_a Plane
    end
end 

# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport


# it 'creates a student class' do
#     student = Student.new
#     expect(student).to be_kind_of(Student)
#   end