require 'plane'


describe Plane do

it "is expected to fly when created" do
	expect(subject.flying?).to be_truthy
end

it "can land" do
	expect(subject.land).to be_falsy
end

it "is landed after landing" do
	expect(subject.landed?).to be_truthy
end

 it 'can take off' do
 	expect(subject.take_off).to be_truthy
 end

 it 'is flying after take off' do
 	subject.take_off
 	expect (subject.flying?).to be_truthy
 end
 
end
