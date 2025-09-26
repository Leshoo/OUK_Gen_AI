impl GuessGame.start {
    next = [root --> (`?turn)][0];
    visit next;
}

impl GuessGame.process_guess {
    if self.guess < here.correct_number {
        print("Too low!");
    } elif self.guess > here.correct_number {
        print("Too high!");
    } else {
        print("🎉 Congratulations! You guessed correctly.");
        disengage;
    }
}
