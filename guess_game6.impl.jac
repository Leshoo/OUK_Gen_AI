impl GuessGame.start {
    next = [root --> (`?turn)][0];
    visit next;
}

impl GuessGame.process_guess {
    if self.guess == here.correct_number {
        print("Congratulations! You guessed correctly.");
        disengage;
    } else {
        print(give_hint(self.guess, here.correct_number));
    }
}
