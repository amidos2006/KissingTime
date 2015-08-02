package gameScene;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import gameEntity.CreditsEntity;
import gameEntity.FlagEntity;
import gameEntity.GameLogoEntity;
import gameEntity.SpaceEntity;
import Global.SexualOrientation;

/**
 * ...
 * @author Amidos
 */
class KissingTimeScene extends BaseScene
{
	public function new() 
	{
		super();
		
		Global.ShuffleGS();
		add(new FlagEntity());
		add(new GameLogoEntity());
		add(new SpaceEntity());
		add(new CreditsEntity());
	}
	
	override public function begin() 
	{
		super.begin();
		
		Global.gameMusic.loop(0.5);
	}
	
	override public function update() 
	{
		if (Input.pressed(Key.SPACE))
		{
			var kiss:Sfx = new Sfx("sounds/Kiss.wav");
			kiss.play();
			HXP.scene = new HelpScene();
		}
		
		super.update();
	}
}