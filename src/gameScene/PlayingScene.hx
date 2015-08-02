package gameScene;
import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Sfx;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import gameEntity.CharactersEntity;
import gameEntity.CharactersEntity.Characters;
import gameEntity.CombinedEntity;
import gameEntity.GameTimerEntity;
import gameEntity.KissEffectEntity;
import gameEntity.ScoreEntity;
import gameEntity.TimerTextEntity;
import gameEntity.TimeTextEntity;
import Global.SexualOrientation;
import Global.GenderIdentity;

/**
 * ...
 * @author Amidos
 */
class PlayingScene extends BaseScene
{
	private var text:TimerTextEntity;
	private var currentCharacter:CharactersEntity;
	private var gameTimer:GameTimerEntity;
	private var score:ScoreEntity;
	
	public function new() 
	{
		super();
		text = new TimerTextEntity(3 * HXP.assignedFrameRate / 2, StartGame);
		text.x = HXP.halfWidth;
		text.y = HXP.halfHeight;
		
		add(text);	
	}
	
	public function StartGame():Void
	{
		remove(text);
		
		currentCharacter = new CharactersEntity(0);
		add(currentCharacter);
		
		add(new CombinedEntity());
		gameTimer = new GameTimerEntity(Global.sceneTime * HXP.assignedFrameRate, AlarmCheck);
		add(gameTimer);
		
		score = new ScoreEntity();
		add(score);
	}
	
	public function Correct():Void
	{
		if (gameTimer.mainAlarm.percent == 1)
		{
			Global.score += 1;
		}
		else
		{
			Global.score += Math.max((1 - gameTimer.mainAlarm.percent) * 3, 1);
		}
		score.UpdateScore();
		Global.shuffleNumber -= 1;
		if (Global.shuffleNumber <= 0)
		{
			Global.ShuffleGS();
			Global.ShuffN();
			Global.AdjustSceneTime();
			
			HXP.scene = new TimeToChangeScene();
			return;
		}
		var temp:Int = currentCharacter.characterFaceID;
		remove(currentCharacter);
		currentCharacter = new CharactersEntity(temp);
		add(currentCharacter);
		gameTimer.StartAlarm(Global.sceneTime * HXP.assignedFrameRate);
	}
	
	private function Wrong():Void
	{
		var sfx:Sfx = new Sfx("sounds/Death.wav");
		sfx.play();
		HXP.scene = new GameoverScene();
	}
	
	public function AlarmCheck():Void
	{
		if (!Check())
		{
			Correct();
		}
		else
		{
			Wrong();
		}
	}
	
	public function Check():Bool
	{
		if (currentCharacter.characterID == Characters.male)
		{
			if (Global.sexualOrientation == SexualOrientation.hetrosexual && Global.genderIdentity == GenderIdentity.male)
			{
				return false;
			}
			
			if (Global.sexualOrientation == SexualOrientation.homosexual && Global.genderIdentity == GenderIdentity.female)
			{
				return false;
			}
		}
		else if (currentCharacter.characterID == Characters.female)
		{
			if (Global.sexualOrientation == SexualOrientation.hetrosexual && Global.genderIdentity == GenderIdentity.female)
			{
				return false;
			}
			
			if (Global.sexualOrientation == SexualOrientation.homosexual && Global.genderIdentity == GenderIdentity.male)
			{
				return false;
			}
		}
		else
		{
			return false;
		}
		
		return true;
	}
	
	override public function update() 
	{
		if (Input.pressed(Key.SPACE))
		{
			add(new KissEffectEntity());
			if (Check())
			{
				var kiss:Sfx = new Sfx("sounds/Kiss.wav");
				kiss.play();
				Correct();
			}
			else
			{
				Wrong();
			}
		}
		
		super.update();
	}
}