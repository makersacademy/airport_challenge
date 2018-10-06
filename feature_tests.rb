def red(mytext) ; "\e[31m#{mytext}\e[0m" ; end
Dir["./feature_tests/*.rb"].sort.each{ |file|
  puts "\n**** #{file} ****"
  begin
   require file
  rescue
     puts red("Feature test returned an error")
  end
  }
