package gameScene;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import gameEntity.FlagEntity;
import gameEntity.HelpEntity;
import gameEntity.SpaceEntity;

/**
 * ...
 * @author Amidos
 */
class HelpScene extends BaseScene
{

	public function new() 
	{
		super();
		
		add(new FlagEntity());
		add(new SpaceEntity());
		add(new HelpEntity());
	}
	
	override public function update() 
	{
		if (Input.pressed(Key.SPACE))
		{
			var kiss:Sfx = new Sfx("sounds/Kiss.wav");
			kiss.play();
			Global.Initialize();
			HXP.scene = new IdentityScene();
		}
		
		super.update();
	}
}