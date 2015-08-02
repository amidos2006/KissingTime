package gameScene;
import com.haxepunk.HXP;
import gameEntity.TimeTextEntity;

/**
 * ...
 * @author Amidos
 */
class TimeToChangeScene extends BaseScene
{
	public function new() 
	{
		super();
		
		var firstText:TimeTextEntity = new TimeTextEntity("Time to Change", 1.5 * HXP.assignedFrameRate, ChangeTime);
		add(firstText);
	}
	
	public function ChangeTime():Void
	{
		HXP.scene = new IdentityScene();
	}
}