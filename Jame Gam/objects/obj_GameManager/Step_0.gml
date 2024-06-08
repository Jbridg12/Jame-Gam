/// @description Insert description here
// You can write your code in this editor


loopElapsedTime += delta_time/1000000;
netElapsedTime += delta_time/1000000;

if(remainingLives <= 0)
{
	// Game Over
	room_goto(MainMenu);	
}

//Perform Significant Difficulty Upgrades
if(netElapsedTime >= 300)
{
	//loop_elapsed_time = 0;
	
}


// Perform Basic Gameplay Loop
if(loopElapsedTime >= 1)
{
	loopElapsedTime = 0;
	
	if(random_range(0, 1) < pNewPlayer && array_length(emptySeats) > 0)
	{
		var _seatIndex = floor(random_range(0, array_length(emptySeats)));
		var _seat = emptySeats[_seatIndex];
		
		array_delete(emptySeats, _seatIndex, 1);
		
		var _temper = random_range(0, 1);
		var _patience = baseHitTimer + (weightedHitTimer * _temper);
		
		// Construct new Player at table
		var _newPlayer = {
			seat : _seat,
			button : _seat + 1,
			basePatience : _patience,
			patienceTimer : _patience,
			temper : _temper,
			hits : 0,
			isHitting : false,
			isCooldown : false,
			hitCooldown : _patience - baseHitTimer
		};
		
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
	
	for(var _i = 0; _i < array_length(seatList); _i++)
	{
		var _player = seatList[_i];
		if(!_player) continue;
		
		var _hitsWeight = _player.hits * 0.25;
		var _pFold = min((pFold + (_player.temper * 0.5)) * _hitsWeight, 0.9);
		if(_player.isHitting)
		{
			if(--_player.patienceTimer <= 0)
			{
				//Lose Health and Leave
				remainingLives--;
				//tipScore -= 100;
				
				// Handle Player Leaving Seat
				leave(_player);
			}
		}
		else if(_player.isCooldown)
		{
			if(--_player.hitCooldown <= 0)
			{
				_player.hitCooldown	= _player.basePatience - baseHitTimer;
				_player.isCooldown = false;
			}
		}
		else if(random_range(0, 1) < _pFold)
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
	
	
}


// Input Detection

for(var _i = 0; _i < array_length(seatList); _i++)
{
	var _player = seatList[_i];
	if(!_player) continue;
	
	if(keyboard_check(ord(_player.button)))
	{
		if(_player.isHitting)
		{
			
			hit(_player);
			_player.isHitting = false;
		}
	}
}