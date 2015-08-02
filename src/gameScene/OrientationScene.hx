package gameScene;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import gameEntity.DancingTextEntity;
import gameEntity.FlagEntity;
import gameEntity.TimeTextEntity;

/**
 * ...
 * @author Amidos
 */
class OrientationScene extends BaseScene
{
	private var firstText:TimeTextEntity;
	
	public function new() 
	{
		super();
		
		firstText = new TimeTextEntity("Your sexual orientation is", 1.5 * HXP.assignedFrameRate, AppearSexualOrientation);
		add(firstText);
	}
	
	public function AppearSexualOrientation():Void
	{
		remove(firstText);
		
		add(new DancingTextEntity(Global.sexualOrientation, 2 * HXP.assignedFrameRate, GoToPlayingScene));
		add(new FlagEntity());
	}
	
	public function GoToPlayingScene():Void
	{
		HXP.world = new PlayingScene();
	}
}