package;
import com.haxepunk.HXP;
import com.haxepunk.Sfx;

class GenderIdentity
{
	public static var male:String = "MALE";
	public static var female:String = "FEMALE";
}

class SexualOrientation
{
	public static var hetrosexual:String = "HetroSexual";
	public static var homosexual:String = "HomoSexual";
	public static var bisexual:String = "BiSexual";
}

/**
 * ...
 * @author Amidos
 */
class Global
{
	public static var gameMusic:Sfx;
	
	public static var genderIdentity:String;
	public static var sexualOrientation:String;
	
	public static var scrollPosition:Float;
	public static var score:Float;
	public static var shuffleNumber:Int;
	public static var sceneTime:Float;
	
	public static function Initialize():Void
	{
		HXP.randomizeSeed();
		
		genderIdentity = GenderIdentity.male;
		sexualOrientation = SexualOrientation.hetrosexual;
		ShuffleGS();
		
		scrollPosition = 0;
		score = 0;
		shuffleNumber = 0;
		ShuffN();
		AdjustSceneTime();
	}
	
	public static function ShuffleGS():Void
	{
		var array:Array<String> = [GenderIdentity.male, GenderIdentity.female];
		var newGender:String = array[HXP.rand(array.length)];
		
		array = [SexualOrientation.hetrosexual, SexualOrientation.homosexual, SexualOrientation.bisexual];
		if (newGender != genderIdentity)
		{
			if (HXP.random < 0.2)
			{
				sexualOrientation = array[HXP.rand(array.length - 1)];
			}
			sexualOrientation = array[HXP.rand(array.length)];
		}
		else
		{
			var location:Int = 0;
			if (sexualOrientation == SexualOrientation.homosexual)
			{
				location = 1;
			}
			if (sexualOrientation == SexualOrientation.bisexual)
			{
				location = 2;
			}
			sexualOrientation = array[(location + HXP.rand(array.length - 1) + 1) % array.length];
		}
		
		genderIdentity = newGender;
	}
	
	public static function ShuffN():Void
	{
		shuffleNumber = HXP.rand(5) + 15;
	}
	
	public static function AdjustSceneTime():Void
	{
		sceneTime = Math.max(1.5 - 0.25 * (score / 30), 0.4);
	}
}