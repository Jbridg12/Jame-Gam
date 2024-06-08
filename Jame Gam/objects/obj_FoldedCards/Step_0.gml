/// @description Insert description here
// You can write your code in this editor


if(active)
{
	if(keyboard_check(ord(button)))
	{
		var _amount = amount;
		with(obj_CollectedCards)
		{
			collectedCards += _amount;
		}
		
		var _index = index;
		// Reset Arrays	
		with(obj_GameManager)
		{
			array_push(emptySeats, _index);
		}
		
		//Reset Object
		button = 0;
		amount = 0;
		active = false;
	}
}