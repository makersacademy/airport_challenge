require 'airplane'

  describe Airplane do 

  	it "has a method to land itself" do 
  		expect(subject).to respond_to(:land)
  	end	

  	it "is initialize with a flying state true by default" do
  		expect(subject.flying).to eq true
  	end

  	it "informs if is flying" do
  		expect(subject.flying?).to eq true
  	end

  	it "can land" do
  		subject.land
  		expect(subject.flying).to eq false
  	end

  	it "can take off" do
  		subject.land
	  	subject.take_off
	  	expect(subject.flying).to eq true
  	end

  end