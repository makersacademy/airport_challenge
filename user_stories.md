Nouns
* pilot
* plane - has status (flying / landed)
* airport

Verbs
* land
* take off
* check if full?
* check if stormy?

airport <-- take off --> plane (status == flying)
airport <-- full? --> true / false
airport <-- stormy? --> true / false



def stormy?
  weather = rand(10)
  if weather <= 8
    @stormy = true
    else
    @stormy = false
    end
    end

instance variable for status --> landed / flying