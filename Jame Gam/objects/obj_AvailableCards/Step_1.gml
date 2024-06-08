/// @description Insert description here
// You can write your code in this editor

if(availableCards <= 0)
{
	with(obj_GameManager)
	{
		shufflePrompt = true;	
	}
	
	// Turn Prompt on
	with(obj_ShufflePrompt)
	{
		active = true;	
	}
}
