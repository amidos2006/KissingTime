package gameScene;
import com.haxepunk.Scene;
import gameEntity.HashtagEntity;

/**
 * ...
 * @author Amidos
 */
class BaseScene extends Scene
{
	public function new() 
	{
		super();
		add(new HashtagEntity());
	}	
}