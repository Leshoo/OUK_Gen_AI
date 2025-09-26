"""A Number Guessing Game"""


import random;
import from byllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""You are a youth mentor guiding a player through a number guessing game. 
The player guessed {guess}, and the correct number is {correct_number}. 
Give ONE short, clear hint in English. The hint should include encouragement or motivation. 
Avoid repeating previous advice. Be warm, supportive, and focused."""
def give_hint(guess: int, correct_number: int) -> str by llm();

walker GuessGame {
    has guess: int;

    can start with `root entry;
    can process_guess with turn entry;
}

node turn {
    has correct_number: int = random.randint(1, 10);
}

# CLI entry point
with entry:__main__ {
    root ++> turn();
    correct = [root --> turn][0].correct_number;

    while True {
        guess = int(input("🌟 Enter your guess (1–10): "));
        root spawn GuessGame(guess);
        if guess == correct {
            break;
        }
    }
}