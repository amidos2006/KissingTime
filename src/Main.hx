package;

import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;
import gameScene.IdentityScene;
import gameScene.KissingTimeScene;
import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author Amidos
 */
class Main extends Engine 
{

	public function new() 
	{
		super(200, 150, 60, true);
		
		Global.gameMusic = new Sfx("sounds/Music.ogg");
		HXP.volume = 1;
		Global.Initialize();
		HXP.world = new KissingTimeScene();
	}

}
