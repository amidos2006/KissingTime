package gameScene;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import gameEntity.GameoverEntity;
import gameEntity.SpaceEntity;

/**
 * ...
 * @author Amidos
 */
class GameoverScene extends BaseScene
{
	public function new() 
	{
		super();
		
		add(new GameoverEntity());
		
		var space:SpaceEntity = new SpaceEntity();
		space.y += 10;
		add(space);
	}
	
	override public function begin() 
	{
		super.begin();
		
		Global.gameMusic.stop();
	}
	
	override public function update() 
	{
		if (Input.pressed(Key.SPACE))
		{
			var kiss:Sfx = new Sfx("sounds/Kiss.wav");
			kiss.play();
			Global.Initialize();
			HXP.scene = new KissingTimeScene();
		}
		
		super.update();
	}
}