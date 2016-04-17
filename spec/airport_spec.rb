require 'airport'

  describe Airport do 

  	it "confirms it has landed" do
  		expect(subject).to respond_to(:land)
  	end	

  	
  end