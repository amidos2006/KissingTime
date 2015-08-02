package gameEntity;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;
import com.haxepunk.HXP;
import com.haxepunk.tweens.misc.Alarm;
import com.haxepunk.Tween.TweenType;
import openfl.Assets;
import openfl.text.TextFormatAlign;

/**
 * ...
 * @author Amidos
 */
class TimerTextEntity extends Entity
{
	private var alarm:Alarm;
	private var endFunction:Void->Void;
	private var text:Text;
	
	public function new(time:Float, endFunction:Void->Void) 
	{
		super();
		
		this.endFunction = endFunction;
		
		alarm = new Alarm(time, AlarmFunction, TweenType.OneShot);
		
		text = new Text("" + Math.ceil(2 * time / HXP.assignedFrameRate));
		text.font = Assets.getFont("fonts/nokiafc22.ttf").fontName;
		text.size = 16;
		text.smooth = false;
		text.align = TextFormatAlign.CENTER;
		text.originX = text.width / 2;
		text.originY = text.height / 2;
		
		graphic = text;
		layer = LayerConstants.gameObjects;
	}
	
	override public function added():Void 
	{
		super.added();
		
		addTween(alarm, true);
	}
	
	private function AlarmFunction(e:Dynamic):Void
	{
		if (endFunction != null)
		{
			endFunction();
		}
	}
	
	override public function update():Void 
	{
		text.text = Math.ceil(2 * alarm.remaining / HXP.assignedFrameRate) + "";
		text.originX = text.width / 2;
		text.originY = text.height / 2;
		
		super.update();
	}
}