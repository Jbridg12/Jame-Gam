// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function hit(_player)
{
	
	// Alert Logic
	with(obj_alert)
	{
		if(index == _player.seat)
		{
			active = false;
		}
	}
	// Throw Card
	
	// Start Cooldown (quickens with difficulty)
	_player.patienceTimer = _player.basePatience;
	_player.isCooldown = true;
	
	// Award tip
	//with(obj_tips) tips += 10 * global.difficulty * _player.temper;
	with(obj_tips) tips += 10 * global.difficulty;
	
}

function fold(_player)
{
	seatList[_player.seat] = 0;
	
	with(obj_Key)
	{
		if (index == _player.seat)
		{
			active = false;
		}
		
	}
	// Clear Hands
	with(obj_hand)
	{
		if (index == _player.seat)
		{
			//active = false;
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
		}
	}
	// Clear Text
	with(obj_alert)
	{
		if(index == _player.seat)
		{
			// Fold on
			active = true
			text = "Fold"
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
		}
	}
	// Take cards into pile
}

function leave(_player)
{
	seatList[_player.seat] = 0;
	
	with(obj_Key)
	{
		if (index == _player.seat)
		{
			active = false;
		}
		
	}
	// Clear Hands
	with(obj_hand)
	{
		if (index == _player.seat)
		{
			//active = false;
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
		}
	}
	// Clear Text
	with(obj_alert)
	{
		if(index == _player.seat)
		{
			// Fold on
			active = true
			text = "Ugh"
			alarm[0] = game_get_speed(gamespeed_fps) * 2;
		}
	}
	// Take cards into pile
}

function shuffle()
{
	// Reset Card count
}