package gameScene;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;
import gameEntity.DancingTextEntity;
import gameEntity.LogoEntity;
import gameEntity.TimeTextEntity;
import Global.GenderIdentity;

/**
 * ...
 * @author Amidos
 */
class IdentityScene extends BaseScene
{
	private var firstText:TimeTextEntity;
	
	public function new() 
	{
		super();
		
		firstText = new TimeTextEntity("Your gender identity is", 1.5 * HXP.assignedFrameRate, AppearGenderIdentity);
		add(firstText);
	}
	
	public function AppearGenderIdentity():Void
	{
		remove(firstText);
		
		add(new DancingTextEntity(Global.genderIdentity, 2 * HXP.assignedFrameRate, GoToOrientationScene));
		add(new LogoEntity());
	}
	
	public function GoToOrientationScene():Void
	{
		HXP.scene = new OrientationScene();
	}
}