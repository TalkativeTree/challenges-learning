Software engineer challenges
 Problem 1: Minesweeper

Create a version of the classic game of Minesweeper. This problem should should take an hour or two to complete, and no more than three hours. Your solution must be in HTML/JavaScript/CSS. If you're applying for one of our mobile engineering positions, use Objective-C (iOS) or Java (Android) as appropriate.


Rules of Minesweeper

Minesweeper is a grid of tiles, each of which may or may not cover hidden mines. The goal is to click on every tile except those that have mines. When a user clicks a tile, one of two things happens. If the tile was covering a mine, the mine is revealed and the game ends in failure. If the tile was not covering a mine, it instead reveals the number of adjacent (including diagonals) tiles that are covering mines – and, if that number was 0, behaves as if the user has clicked on every cell around it. When the user is confident that all tiles not containing mines have been clicked, the user presses a Validate button (often portrayed as a smiley-face icon) that checks the clicked tiles: if the user is correct, the game ends in victory, if not, the game ends in failure.


Design constraints

Use HTML, CSS, and JavaScript (libraries like jQuery, Backbone, and Angular are welcome) to craft your solution.
The board should be an 8x8 grid and by default 10 hidden mines are randomly placed into the board.
The interface should support these additional functions:
New Game: start a new, randomly generated game.
Validate: check that a user has correctly marked all the tiles and end the game in either victory or failure
Cheat: in any manner you deem appropriate, reveal the locations of the mines without ending the game.

Most importantly

Your code must be well-structured and built in the spirit of maintainability and extensibility. Additional features are encouraged though not required: saving/loading, changing difficulty level, changing the size of the board.
 Problem 2: Simple Database

In the Simple Database problem, you'll implement an in-memory database similar to Redis. For simplicity's sake, instead of dealing with multiple clients and communicating over the network, your program will receive commands via standard input (stdin), and should write appropriate responses to standard output (stdout).
Guidelines

This problem should take you between 30 and 90 minutes.
We recommend that you use a high-level language, like Python, Ruby, JavaScript, or Java. We're much more interested in seeing clean code and good algorithmic performance than raw throughput.
Data Commands

Your database should accept the following commands:
SET name value – Set the variable name to the value value. Neither variable names nor values will contain spaces.
GET name – Print out the value of the variable name, or NULL if that variable is not set.
UNSET name – Unset the variable name, making it just like that variable was never set.
NUMEQUALTO value – Print out the number of variables that are currently set to value. If no variables equal that value, print 0.
END – Exit the program. Your program will always receive this as its last command.
Commands will be fed to your program one at a time, with each command on its own line. Any output that your program generates should end with a newline character. Here are some example command sequences:
INPUT OUTPUT
SET ex 10
GET ex
UNSET ex
GET ex
END

10

NULL

INPUT OUTPUT
SET a 10
SET b 10
NUMEQUALTO 10
NUMEQUALTO 20
SET b 30
NUMEQUALTO 10
END


2
0

1

Transaction Commands

In addition to the above data commands, your program should also support database transactions by also implementing these commands:
BEGIN – Open a new transaction block. Transaction blocks can be nested; a BEGIN can be issued inside of an existing block.
ROLLBACK – Undo all of the commands issues in the most recent transaction block, and close the block. Print nothing if successful, or print NO TRANSACTION if no transaction is in progress.
COMMIT – Close all open transaction blocks, permanently applying the changes made in them. Print nothing if successful, or print NO TRANSACTION if no transaction is in progress.
Any data command that is run outside of a transaction block should commit immediately. Here are some example command sequences:
INPUT OUTPUT
BEGIN
SET a 10
GET a
BEGIN
SET a 20
GET a
ROLLBACK
GET a
ROLLBACK
GET a
END


10


20

10

NULL

INPUT OUTPUT
BEGIN
SET a 30
BEGIN
SET a 40
COMMIT
GET a
ROLLBACK
END





40
NO TRANSACTION

INPUT OUTPUT
SET a 50
BEGIN
GET a
SET a 60
BEGIN
UNSET a
GET a
ROLLBACK
GET a
COMMIT
GET a
END


50



NULL

60

60

INPUT OUTPUT
SET a 10
BEGIN
NUMEQUALTO 10
BEGIN
UNSET a
NUMEQUALTO 10
ROLLBACK
NUMEQUALTO 10
COMMIT
END


1


0

1


Performance Considerations

The most common operations are GET, SET, UNSET, and NUMEQUALTO. All of these commands should have an expected worst-case runtime of O(log N) or better, where N is the total number of variables stored in the database.
The vast majority of transactions will only update a small number of variables. Accordingly, your solution should be efficient about how much memory transactions use.
 Problem 3: Espresso Bar Slot Machine

At Thumbtack, engineers and designers enjoy a healthy dose of caffeine in the morning. They like to drink coffee, tea, or espresso. Your goal is to build a slot machine to award lucky users one of these random beverages. Your solution should be in JavaScript and CSS. You may use standard libraries like jQuery, Underscore, Backbone, and/or Angular. If you're applying for one of our mobile engineering positions, use Objective-C (iOS) or Java (Android) as appropriate.

Your slot machine should have three reels:

The first reel has a coffee maker, a teapot, and an espresso machine.
The second reel has a coffee filter, a tea strainer, and an espresso tamper.
The third reel has coffee grounds, loose tea, and ground espresso beans.
When the lever is pulled (you can simulate this with the click of a button), the slot machine goes into action. Each reel spins and randomly stops on one of the three options. If the user is lucky, the three reels will line up and she will be rewarded with a tasty hot beverage. Your solution should show the user what beverage she's won. For example, if the reels show coffee maker, coffee filter, and coffee grounds, the user wins a cup of coffee.

We'll be looking for exceptionally clean JavaScript and CSS. In addition, you should use this as an opportunity to show off your front-end skills. The more fanciful and exciting your solution, the better.