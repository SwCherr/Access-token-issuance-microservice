## Maze
Микросервис по выдачи пары токенов доступа (Access, Refresh) <br>
The program is developed in C++17 using the SFML library.<br>

Maze program is designed to read and display mazes from a file, as well as generate unique mazes of a given size. There is also a function for solving mazes from user-specified points.<br>

You can open the maze file by clicking the "Open file" button.
<br>
To generate a maze, set the size in the range from 1 to 50 for the number of rows (cell on the left) and columns (cell on the right). 
Next, click on the "Generate" button.<br>


To launch the maze solving function, click on any point in the displayed maze. The first press sets the starting point.<br>
Next, click again on any point of the displayed labyrinth. The second press sets the end point.<br>
After this, a path to solve the maze between user-specified points will be constructed.<br>
To reset the maze solution, click on the displayed maze again.<br>

## Installation
To install, you will need cmake, make, and a GCC compiler.<br>
Navigate to the `src` directory and run the `make install` command.

## For developers
The project is developed following on the SFML cross-platform gui library, in C++17 language .<br>
All code related to the Model block is documented. To view the doxygen documentation, navigate to the `src` directory and run the `make dvi` command.<br>
All code related to the Model block is covered on 100% with unit tests. Run command `make gcov_report` from `src`
directory, to view the coverage report.<br>
