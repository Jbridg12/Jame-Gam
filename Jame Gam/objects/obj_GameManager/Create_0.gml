/// @description Insert description here
// You can write your code in this editor


shufflePrompt = false;

loopElapsedTime = 0;
difficultyTimer = 0;


// Table Parameters
maxSeats = 5;
seatList = array_create(maxSeats);
emptySeats = array_create_ext(maxSeats, seat_init);



// Probabilities
pNewPlayer = 0.5;
pHit = 0.75;
pFold = 0.2;

// Timer
baseHitTimer = 7;
weightedHitTimer = 7;
hitCooldown = 7;
actionCooldownBase = 7;


//Victory Conditions
tipScore = 0;
remainingLives = 5;

