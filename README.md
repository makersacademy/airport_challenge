
                      __  __       _
                     |  \/  |     | |
          /L|0\      | \  / | __ _| | _____ _ __ ___
         /  |  \     | |\/| |/ _` | |/ / _ \ '__/ __|
        /       \    | |  | | (_| |   <  __/ |  \__ \
       /    |    \   |_|  |_|\__,_|_|\_\___|_|  |___/
      /           \
     /  __  | __   \         /\   (_)                     | |
    /  __/    \__   \       /  \   _ _ __ _ __   ___  _ __| |_
   /  /__   |  __\   \     / /\ \ | | '__| '_ \ / _ \| '__| __|
  /___________________\   / ____ \| | |  | |_) | (_) | |  | |_
 /           |         \ /_/    \_\_|_|  | .__/ \___/|_|   \__|
        /   _|_   \                      | |
/      ____/___\____     \               | |
___________[o0o]___________              |_|
         _____ _           _ _
        / ____| |         | | |
       | |    | |__   __ _| | | ___ _ __   __ _  ___
       | |    | '_ \ / _` | | |/ _ \ '_ \ / _` |/ _ \
       | |____| | | | (_| | | |  __/ | | | (_| |  __/
        \_____|_| |_|\__,_|_|_|\___|_| |_|\__, |\___|
                                           __/ |
                                          |___/

Logo made using [https://www.kammerl.de/ascii/AsciiSignature.php](ASCII Text Signature Generator)

### The Task


We have a request from a client to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.  Here are the user stories that we worked out in collaboration with the client:

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport

As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy

As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```


* **Submit a pull request early.**  There are various checks that happen automatically when you send a pull request.  **Fix these issues if you can**.  Green is good.

* Finally, please submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am.
