def red(mytext) ; "\e[31m#{mytext}\e[0m" ; end
<<<<<<< HEAD

=======
>>>>>>> a678cb5e64440e17da1c6c117efb0ad616e575f6
Dir["./feature_tests/*.rb"].sort.each{ |file|
  puts "\n**** #{file} ****"
  begin
   require file
  rescue
     puts red("Feature test returned an error")
  end
  }
