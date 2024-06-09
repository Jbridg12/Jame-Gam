/// @description Insert description here
// You can write your code in this editor


if(abs(x - destinationX) <= tolerance && abs(y - destinationY <= tolerance))
	{
		instance_destroy();
	}
	
	else
	{
		move_towards_point(destinationX, destinationY, 10);
		image_angle += rotationSpeed;
	}