
I plan to do my best to make very little baby steps while working on this project.
I plan to follow the steps, we used to complete challenges during the week.
I will write very detailed explanation of what I do, mainly for myself. When I feel more comfartable, explanation probably will become less detailed.

Started to work on the first piece of the user story. 

1. First I organised the nouns and verbs into Objects and Messages

Objects 			Messages						Comments

Pilot
Destination (same as airoport?)
Plane				land (appropriate airport)		not sure about use of appropriate airoport yet	
Airport

Conclusion - probably will start to work from Plane class.

2. Out of interest I run rspec on existing tests. Received very interesting result that all tests were skipped, read about pending examples.

3. I read existing tests for Plane class.

xit 'is flying when created' - seems to be to early for this test.

As I understand from the Task and the contest ot the user story, a plane can be either flying or landed. So the plane should respond to flying? first.

This is my starting point. 

4. First test.

4.1. Feature test in irb

:001 > plane = Plane.new
=> #<Plane:0x007f919a0e72d8> 
:002 > plane.flying?
NoMethodError: undefined method `flying?' for #<Plane:0x007f919a0e72d8>
	from (irb):2
	from /Users/yana/.rvm/rubies/ruby-2.2.1/bin/irb:11:in `<main>'
:003 > 

Does not respond to flying? yet.

4.2. Wrote the test, made it fail. 

4.3 Wrote empty method flying? in Plane. Now the test pass. A plane responds to flying?










