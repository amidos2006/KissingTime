package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;
import com.haxepunk.tweens.misc.Alarm;
import com.haxepunk.Tween.TweenType;

/**
 * ...
 * @author Amidos
 */
class GameTimerEntity extends Entity
{
	private var image:Image;
	private var timeImage:Image;
	
	private var endFunction:Void->Void;
	public var mainAlarm:Alarm;
	
	public function new(time:Float, endFunction:Void->Void) 
	{
		super();
		x = HXP.halfWidth;
		y = 2;
		
		this.endFunction = endFunction;
		mainAlarm = new Alarm(time, AlarmEnd, TweenType.Persist);
		
		image = new Image("graphics/time.png");
		image.smooth = false;
		image.originX = image.width / 2;
		image.originY = 0;
		
		timeImage = new Image("graphics/TimeBar.png");
		timeImage.smooth = false;
		timeImage.originX = timeImage.width / 2;
		timeImage.originY = -9;
		
		graphic = new Graphiclist([image, timeImage]);
		layer = LayerConstants.hud;
	}
	
	override public function added():Void 
	{
		super.added();
		
		addTween(mainAlarm, true);
	}
	
	public function StartAlarm(time:Float):Void
	{
		mainAlarm.reset(time);
		mainAlarm.start();
	}
	
	private function AlarmEnd(e:Dynamic):Void
	{
		if (endFunction != null)
		{
			endFunction();
		}
	}
	
	override public function update():Void 
	{
		super.update();
		
		timeImage.scaleX = 1 - mainAlarm.percent;
	}
}