"""A Number Guessing Game"""

import random;

walker GuessGame {
    has guess: int;

    can start with `root entry;
    can process_guess with turn entry;
}

node turn {
    has correct_number: int = 0;
}

# Will run when in CLI mode (not in cloud)
with entry:__main__ {
    # Create one turn node and set the correct number
    root ++> turn();
    [root --> turn][0].correct_number = random.randint(1, 10);

    # Loop until correct guess
    while True {
        guess = int(input("Enter your guess (1–10): "));
        root spawn GuessGame(guess);
        if guess == [root --> turn][0].correct_number {
            break;
        }
    }
}
