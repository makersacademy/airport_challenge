Description

This is a small program that allows the user to create airports & aeroplanes, and fly the planes from one airport to another, subject to weather conditions of course!

Installation

None required, just run your preferred Ruby REPL in the package's parent directory & require-in the ./lib/ files

Alternatively, if you are using the irb REPL, create a file called .irbrc in your $HOME directory & insert "Dir['./lib/*.rb'].each { |f| require f }" in order to automate the requirement process.

Testing

If you want to run the test suite on the libraries, run rspec from the command line on the package's parent directory. The tests cover both feature & unit tests.
