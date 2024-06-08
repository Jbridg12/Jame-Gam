/// @description Insert description here
// You can write your code in this editor

var _dT = delta_time/1000000;
loopElapsedTime += _dT;
difficultyTimer += _dT;

if(remainingLives <= 0)
{
	// Game Over
	room_goto(MainMenu);	
}

//Perform Significant Difficulty Upgrades
if(difficultyTimer >= 30)
{
	global.difficulty ++;
	difficultyTimer = 0;
	
}


// Perform Basic Gameplay Loop
if(loopElapsedTime >= 1)
{
	loopElapsedTime = 0;
	
	if(random_range(0, 1) < pNewPlayer && array_length(emptySeats) > 0)
	{
		var _seatIndex = irandom_range(0, array_length(emptySeats)-1);
		var _seat = emptySeats[_seatIndex];
		
		array_delete(emptySeats, _seatIndex, 1);
		
		// Construct new Player at table
		var _newPlayer = new_player(_seat);
		
		seatList[_seat] =  _newPlayer;
		
		with(obj_hand)
		{
			if (index == _seat)
			{
				active = true;
			}
		}
		with(obj_Key)
		{
			if (index == _seat)
			{
				active = true;
				text = string("{0}", _newPlayer.button);
			}
		}

	}
}

for(var _i = 0; _i < array_length(seatList); _i++)
{
	var _player = seatList[_i];
	if(!_player) continue;
		
	if(_player.isHitting)
	{
		_player.patienceTimer -= _dT;
		if(_player.patienceTimer <= 5)
		{
			with(obj_alert)
			{
				if(index == _player.seat)
				{
					// Fold on
					text = "Uh..."
				}
			}
		}
		if(_player.patienceTimer <= 0)
		{
			//Lose Health and Leave
			remainingLives--;
			//tipScore -= 100;
				
			// Handle Player Leaving Seat
			leave(_player);
		}
		continue;
	}
	else if(_player.isCooldown)
	{
		_player.hitCooldown -= _dT;
		if(_player.hitCooldown <= 0)
		{
			_player.hitCooldown	= _player.basePatience - baseHitTimer;
			_player.isCooldown = false;
		}
		continue;
	}
	
	_player.actionCooldown -= _dT;
	if(_player.actionCooldown > 0) continue;
	_player.actionCooldown =  actionCooldownBase / global.difficulty;
	
	var _foldWeight = _player.hits * 0.25;
	var _pFold = min((pFold + (_player.temper * 0.5)) * _foldWeight, 0.9);
	if(random_range(0, 1) < _pFold)
	{
		// Handle Player Leaving Seat (FOLD)
		fold(_player);
	}
	else if(random_range(0, 1) < pHit)
	{
		with(obj_alert)
		{
			if(index == _player.seat)
			{
				text = "Hit";
				active = true;
			}
		}
			
		_player.isHitting = true;
		_player.hits++;
	}
	
}


// Input Detection

for(var _i = 0; _i < array_length(seatList); _i++)
{
	var _player = seatList[_i];
	if(!_player) continue;
	
	if(keyboard_check(ord(_player.button)))
	{
		if(_player.isHitting && !shufflePrompt)
		{
			
			hit(_player);
			_player.isHitting = false;
		}
	}
}