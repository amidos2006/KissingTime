package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import com.haxepunk.Tween.TweenType;
import com.haxepunk.tweens.misc.Alarm;
import openfl.Assets;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Amidos
 */
class TimeTextEntity extends Entity
{
	private var text:Text;
	private var alarmFunction:Void->Void;
	private var alarm:Alarm;
	
	public function new(input:String, time:Float, endFunction:Void->Void) 
	{
		super();
		
		x = HXP.halfWidth;
		y = HXP.halfHeight;
		
		alarmFunction = endFunction;
		
		text = new Text(input);
		text.font = Assets.getFont("fonts/nokiafc22.ttf").fontName;
		text.size = 8;
		text.smooth = false;
		text.align = TextFormatAlign.CENTER;
		text.originX = text.width / 2;
		text.originY = text.height / 2;
		
		alarm = new Alarm(time, AlarmEnds, TweenType.OneShot);
		
		graphic = text;
		layer = LayerConstants.gameObjects;
	}
	
	override public function added():Void 
	{
		super.added();
		
		addTween(alarm, true);
	}
	
	private function AlarmEnds(e:Dynamic):Void
	{
		if (alarmFunction != null)
		{
			alarmFunction();
		}
	}
}