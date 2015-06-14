require 'flight'

describe Flight do

  describe "set_flight" do
    it " Asks for data" do
      subject.set_flight
        expect { print("Write depart airport, arrival airport, pilot, plane") }.to output.to_stdout 
    end 

    
  end

end