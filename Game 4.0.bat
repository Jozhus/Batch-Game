@echo off
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo            0000000000   00000   000000000   00000             00000
echo            0        0   0   0   0       0   0   0             0   0
echo            0   000000   00000   0 000   0   0   0         00000   00000
echo            0   0                0 000   0   0   0         0           0
echo            0   0000     00000   0       0   0   00000000  00000   00000
echo            0      0     0   0   000000  0   0          0      0   0
echo            0   0000     0   0        0  0   0   0000   0      0   0
echo            0   0        0   0   000000  0   0   0  0   0      0   0
echo            0   0        0   0   0       0   0   0  0   0      0   0
echo            00000        00000   000000000   00000  00000      00000
echo.
echo                                   Fuck titles.
echo.
echo.
echo.
echo.
echo.
pause

:MENU
set menuch=0
cls
echo.
echo.
echo.
echo.
echo.
echo                                     [Play]
echo.
echo.
echo.
echo                                   [Tutorial]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p menuch=Choice: 
if /i %menuch%==play GOTO Name
if /i %menuch%==tutorial GOTO Tutorial
GOTO MENU

:NAME
cls
echo.
echo.
echo.
echo.
echo.
echo                                What's your name?
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p name=Choice: 
GOTO Difficulty


:DIFFICULTY
set notround1=0
set diff=0
set roundcount=0
cls
echo.
echo.
echo                              Choose a difficulty:
echo.
echo                              [Easy]
echo.
echo                              [Medium]
echo.
echo                              [Hard]
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p diff=Choice: 

:DIFF
if /i %diff%==easy GOTO EASY
if /i %diff%==medium GOTO MEDIUM
if /i %diff%==hard GOTO HARD
GOTO Difficulty
 
:THEGAME
set whppotions=5
set shppotions=3
set hhppotions=1
set wmppotions=3
set smppotions=1
set hmppotions=1
set fhpotions=1
set typicalmoneyvar=0
set healhp=0
set healmp=0
set dattack=0
set stuncount=0
set burn=0
set skilldmg=0
set wincount=0
set score=0
set scoremultiplyer=1
set speedcheck=1
set status=None
GOTO Game

::Difficulty and enemy health here

:EASY
set rndmax=90
set currlabel=easy
set /a roundbonushealth=%roundcount%*30
call :RANDOM
:EASYCON
set monsterhealth=%rnd%
if %monsterhealth% LSS 50 GOTO EASY
set /a monsterhealth=%monsterhealth%+%roundbonushealth%
set mspeed=3
if %notround1%==1 GOTO Game
set roundcount=1
GOTO Class

:MEDIUM
set rndmax=160
set currlabel=medium
set /a roundbonushealth=%roundcount%*45
call :RANDOM
:MEDIUMCON
set monsterhealth=%rnd%
if %monsterhealth% LSS 100 GOTO MEDIUM
set /a monsterhealth=%monsterhealth%+%roundbonushealth%
set mspeed=4
if %notround1%==1 GOTO Game
set roundcount=1
GOTO Class

:HARD
set rndmax=230
set currlabel=hard
set /a roundbonushealth=%roundcount%*60
call :RANDOM
:HARDCON
set monsterhealth=%rnd%
if %monsterhealth% LSS 170 GOTO HARD
set /a monsterhealth=%monsterhealth%+%roundbonushealth%
set mspeed=5
if %notround1%==1 GOTO Game
set roundcount=1
GOTO Class

:CLASS
cls
set class=0
echo.
echo.
echo.
echo.
echo                               Choose your class:
echo.
echo               /                           *
echo         (o_o)x                       (;.;)^|                    (-.-)D
echo.
echo        [Warrior]                    [Wizard]                  [Archer]
echo -------------------------------------------------------------------------------
echo   Strong, sturdy, gets          Powerful and wise.       Quick and accurate.
echo  shit done. Uses swords            Uses Staves               Uses Bows
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p class=Choice: 
if /i %class%==warrior GOTO Warrior
if /i %class%==wizard GOTO Wizard
if /i %class%==archer GOTO Archer
GOTO Class

:WARRIOR
set playerhealth=100
set phealthmax=100
set playermana=80
set pmanamax=80
set speed=3
set str=5
set parmor=0
set wepe=wsword
set helme=none
set cheste=none
set legse=none
set bootse=none
set shielde=wshield
GOTO EquipStats

:WIZARD
set playerhealth=50
set phealthmax=50
set playermana=200
set pmanamax=200
set speed=4
set str=0
set parmor=0
set wepe=wstaff
set helme=none
set cheste=none
set legse=none
set bootse=none
set shielde=none
GOTO EquipStats

:ARCHER
set playerhealth=75
set phealthmax=75
set playermana=125
set pmanamax=125
set speed=5
set str=2
set parmor=0
set wepe=wsbow
set helme=none
set cheste=none
set legse=none
set bootse=none
set shielde=none
GOTO EquipStats


:GAME
set action=0
if /i %class%==warrior (set wept=/) & set hilt=x
if /i %class%==wizard (set wept=*) & set hilt=/
if /i %class%==archer set hilt=D
cls
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo               Actions
echo              ---------
echo     Attack (a)          Skills (s)
echo.
echo     Item   (i)          Skip   (sk)
echo.
echo.
echo.
set /p action=Choice: 
if /i %action%==attack GOTO ATTACK
if /i %action%==skip GOTO MONSTERATTACK
if /i %action%==item GOTO ITEMS
if /i %action%==skills GOTO SKILLS
if /i %action%==a GOTO ATTACK
if /i %action%==sk GOTO MONSTERATTACK
if /i %action%==i GOTO ITEMS
if /i %action%==s GOTO SKILLS
GOTO GAME

::Attack screen

:ATTACK
cls
if %speedcheck%==1 if %speed% LSS %mspeed% GOTO MonsterAttack
set rndmax=2
set currlabel=speeddecider
call :RANDOM
:SPEEDDECIDER
set speeddecider=%rnd%
if %speedcheck%==1 if %speed%==%mspeed% GOTO MonsterAttack
set speedcheck=0
set /a rndmax=20+%str%
set currlabel=pattack
call :RANDOM
:PATTACK
set pdmg=%rnd%
set rndmax=20+%str%
set currlabel=pcrit
call :RANDOM
:PCRIT
set crit=%rnd%
if %dattack% GTR 0 set /a pdmg=%pdmg%/2
set /a pdmg=%pdmg%+%padddmg%+%skilldmg%
if /i %name%==jozhus set pdmg=9999999
set basepdmg=%pdmg%
if %pdmg%==%crit% set /a pdmg=%pdmg%*10
set /a monsterhealth=%monsterhealth%-%pdmg%
if %pdmg%==0 set pdmg=MISS
if %monsterhealth% LEQ 0 set monsterhealth=0
if /i %class%==wizard GOTO WAttack
if /i %class%==archer GOTO AAttack
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo                                    -%pdmg%
echo.
echo                                \
echo                    -( o_o)-+--- x-(x_x )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%    Crit: %crit%  Damage: %basepdmg%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
PING 1.1.1.1 -n 1 -w 1000 >NUL
GOTO AttackCon
:WAttack
if %skilldmg% GTR 1 color b1
if %burn%==1 color c4
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo                                    -%pdmg%
echo.
echo                            \   \
echo     -( o.o)--*              ^|  x-(x_x )-
echo                            /
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%    Crit: %crit%  Damage: %basepdmg%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
PING 1.1.1.1 -n 1 -w 1000 >NUL
GOTO AttackCon
:AAttack
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo                                    -%pdmg%
echo.
echo                                \
echo     -( o.o)D                #--^>x-(x_x )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%   Crit: %crit%  Damage: %basepdmg%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
PING 1.1.1.1 -n 1 -w 1000 >NUL
:ATTACKCON
color 07
set skilldmg=0
if %monsterhealth%==0 GOTO Win
if %stuncount% GTR 0 GOTO MonsterStun
if %dattack%==1 (set dattack=2) & goto Attack
if %dattack%==2 (set dattack=0) & if %stuncount% GTR 0 (GOTO MonsterStun) else GOTO MonsterAttack
GOTO MonsterAttack

::Monster attack screen

:MONSTERATTACK
cls
if %speedcheck%==0 if %stuncount% GTR 0 GOTO Game
set rndmax=15
set currlabel=monattack
call :RANDOM
:MONATTACK
set mdmg=%rnd%
set rndmax=15
set currlabel=moncrit
call :RANDOM
:MONCRIT
set mcrit=%rnd%
set /a basemdmg=%mdmg%
::Jozhus wuz here :3
if /i %class%==warrior (set wept=/) & set hilt=x
if /i %class%==wizard (set wept=*) & set hilt=/
if /i %class%==archer set hilt=D
if %mdmg%==%mcrit% set /a mdmg=%mdmg%*5
set /a mdmg=%mdmg%-%parmor%
if %mdmg% LSS 0 set mdmg=0
set /a playerhealth=%playerhealth%-%mdmg%
if %mdmg%==0 set mdmg=MISS
if %playerhealth% LEQ 0 set playerhealth=0
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%                       
echo     HP: %monsterhealth%   Mana: N/A   Crit: %mcrit%  Damage: %basemdmg%
echo -------------------------------------------------------------------------------
echo.
echo        -%mdmg%
echo.
echo.             %wept%
echo     -( x.x)-%hilt% ---+-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
PING 1.1.1.1 -n 1 -w 1000 >NUL
if %playerhealth%==0 GOTO Lose
if %playermana% GTR %pmanamax% set playermana=%pmanamax%
if %speedcheck%==1 (set speedcheck=0) & GOTO Attack
if %burn% GTR 0 GOTO Dot
GOTO Game

:DOT
set /a monsterhealth=%monsterhealth%-%basepdmg% 
set /a burn+=1
if %monsterhealth% LEQ 0 set monsterhealth=0
color c4
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo                                     -%basepdmg%
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(x_x )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
PING 1.1.1.1 -n 1 -w 1000 >NUL
if %monsterhealth%==0 GOTO Win
if %burn%==4 if %stuncount% GTR 0 (set burn=0) & (set status=Sleeping) else (set burn=0) & set status=None
color 07
GOTO Game

::Stunned screen here

:MONSTERSTUN
cls
if /i %class%==warrior (set wept=/) & set hilt=x
if /i %class%==wizard (set wept=*) & set hilt=/
if /i %class%==archer set hilt=D
if /i %skill%==sl set effect=Sleeping
if /i %skill%==s set effect=Stunned
if /i %skill%==b set effect=Stunned
set /a stuncount+=1
if %stuncount%==4 if %burn% GTR 0 (set stuncount=0) & (set status=Burned) else (set stuncount=0) & set status=None
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo                                  *%effect%*
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
PING 1.1.1.1 -n 1 -w 1000 >NUL
if /i %class%==warrior set /a playermana=%playeremana%+5
if /i %class%==wizard set /a playermana=%playermana%+10
if /i %class%==archer set /a playermana=%playermana%+5
if %playermana% GTR %pmanamax% set playermana=%pmanamax%
if %burn% GTR 0 GOTO Dot
GOTO GAME

::Item interface

:ITEMS
set use=0
if /i %class%==warrior (set wept=/) & set hilt=x
if /i %class%==wizard (set wept=*) & set hilt=/
if /i %class%==archer set hilt=D
cls
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo                 ITEMS
echo               ---------
echo WeakHp   (wh)     x%whppotions%   WeakMp   (wm)     x%wmppotions%
echo StrongHp (sh)     x%shppotions%   StrongMp (sm)     x%smppotions%
echo HyperHp  (hh)     x%hhppotions%   HyperMp  (hm)     x%hmppotions%
echo FullHeal (fh)     x%fhpotions%
echo                                       Cancel
echo.
set /p use=Choice: 
if /i %use%==weakhp GOTO WHPPOT
if /i %use%==stronghp GOTO SHPPOT
if /i %use%==hyperhp GOTO HHPPOT
if /i %use%==weakmp GOTO WMPPOT
if /i %use%==strongmp GOTO SMPPOT
if /i %use%==hypermp GOTO HMPPOT
if /i %use%==fullheal GOTO FHPOT
if /i %use%==wh GOTO WHPPOT
if /i %use%==sh GOTO SHPPOT
if /i %use%==hh GOTO HHPPOT
if /i %use%==wm GOTO WMPPOT
if /i %use%==sm GOTO SMPPOT
if /i %use%==hm GOTO HMPPOT
if /i %use%==fh GOTO FHPOT
if /i %use%==cancel GOTO GAME
GOTO ITEMS

::Potions here

:WHPPOT
if %whppotions%==0 GOTO ITEMS
set /a whppotions-=1
set healhp=50
GOTO HEALHP

:SHPPOT
if %shppotions%==0 GOTO ITEMS
set /a shppotions-=1
set healhp=100
GOTO HEALHP

:HHPPOT
if %hhppotions%==0 GOTO ITEMS
set /a hhppotions-=1
set healhp=250
GOTO HEALHP

:WMPPOT
if %wmppotions%==0 GOTO ITEMS
set /a wmppotions-=1
set healmp=40
GOTO HEALMP

:SMPPOT
if %smppotions%==0 GOTO ITEMS
set /a smppotions-=1
set healmp=80
GOTO HEALMP

:HMPPOT
if %hmppotions%==0 GOTO ITEMS
set /a hmppotions-=1
set healmp=100
GOTO HEALMP

:FHPOT
if %fhpotions%==0 GOTO ITEMS
set /a fhpotions-=1
GOTO FULLHEAL

::Healing hp screen

:HEALHP
cls
if /i %class%==warrior (set wept=/) & set hilt=x
if /i %class%==wizard (set wept=*) & set hilt=/
if /i %class%==archer set hilt=D
set /a playerhealth=%playerhealth%+%healhp%
if %playerhealth% gtr %phealthmax% set playerhealth=%phealthmax%
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo        +%healhp% Hp
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
PING 1.1.1.1 -n 1 -w 1000 >NUL
if %stuncount% GTR 0 GOTO MONSTERSTUN
GOTO MONSTERATTACK

::Healing mp screen

:HEALMP
cls
if /i %class%==warrior (set wept=/) & set hilt=x
if /i %class%==wizard (set wept=*) & set hilt=/
if /i %class%==archer set hilt=D
set /a playermana=%playermana%+%healmp%
if %playermana% gtr %pmanamax% set playermana=%pmanamax%
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo        +%healmp% Mp
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
PING 1.1.1.1 -n 1 -w 1000 >NUL
if %stuncount% GTR 0 GOTO MONSTERSTUN
GOTO MONSTERATTACK

:FULLHEAL
cls
if /i %class%==warrior (set wept=/) & set hilt=x
if /i %class%==wizard (set wept=*) & set hilt=/
if /i %class%==archer set hilt=D
set playerhealth=%phealthmax%
set playermana=%pmanamax%
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo        +MAX Hp
echo        +MAX Mp
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.
echo.
echo.
PING 1.1.1.1 -n 1 -w 1000 >NUL
if %stuncount% GTR 0 GOTO MONSTERSTUN
GOTO MONSTERATTACK


::Skills interface

:SKILLS
if /i %class%==warrior (set wept=/) & set hilt=x
if /i %class%==wizard (set wept=*) & (set hilt=/) & GOTO WSKILLS
if /i %class%==archer (set hilt=D) & GOTO ASkills
set skill=0
cls
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo       Skills         Mana          Description
echo      --------       ------        -------------
echo       Double (d)      40      Hits twice, but weakly.       
echo       Stun (s)        80      Stuns enemy for 2 turns.       
echo.         
echo                                       Cancel
echo.
echo.
set /p skill=Choice: 
if /i %skill%==double GOTO DATTACK
if /i %skill%==stun GOTO STUN
if /i %skill%==s GOTO STUN
if /i %skill%==d GOTO DATTACK
if /i %skill%==cancel GOTO GAME
GOTO Skills
:WSKILLS
cls
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo       Skills         Mana          Description
echo      --------       ------        -------------
echo       Surf (s)        30      Hits enemy with decent damage.
echo       Fire Ball (f)   40      Hits enemy and burns them for 3 turns.    
echo       Sleep (sl)      80      Causes enemy to sleep for 2 turns.         
echo                                       Cancel
echo.
echo.
set /p skill=Choice: 
if /i %skill%==s GOTO Surf
if /i %skill%==f GOTO FBall
if /i %skill%==sl GOTO Stun
if /i %skill%==cancel GOTO Game
GOTO WSKILLS
:ASKILLS
cls
echo -------------------------------------------------------------------------------
echo         Monster           Status: %status%
echo     HP: %monsterhealth%   Mana: N/A
echo -------------------------------------------------------------------------------
echo.
echo.
echo.
echo.             %wept%                 \
echo     -( o.o)-%hilt%                   x-(._. )-
echo.
echo.
echo round: %roundcount%
echo -------------------------------------------------------------------------------
echo         %name%
echo     HP: %playerhealth%   Mana: %playermana%
echo -------------------------------------------------------------------------------
echo       Skills         Mana          Description
echo      --------       ------        -------------
echo       Aimed Shot (a)  30      A strong shot aimed at enemy's weak spot.    
echo       Bomb Shot (b)   50      Exploding shot that stuns for 2 turns.   
echo.      
echo                                       Cancel
echo.
echo.
set /p skill=Choice: 
if /i %skill%==a GOTO Aimed
if /i %skill%==b GOTO Stun
if /i %skill%==cancel GOTO Game
GOTO ASkills

::Skills are here

::Double Attack here

:DATTACK
if %playermana% LSS 40 GOTO Skills
set /a playermana-=40
set dattack=1
GOTO Attack

::Stun here

:STUN
if %playermana% LSS 80 GOTO Skills
if %stuncount% GTR 0 GOTO Skills
set /a playermana-=80
if /i %skill%==sl if %status%==Burned (set status=Sleeping+Burned) else (set status=Sleeping)
if /i %skill%==sl (set stuncount=1) & (set speedcheck=0) & GOTO MonsterStun
if /i %skill%==s set status=Stunned
if /i %skill%==b (set skilldmg=40) & set status=Stunned
set stuncount=1
GOTO Attack

:FBALL
if %burn% GTR 0 GOTO Skills
if %playermana% LSS 40 GOTO Skills
set /a playermana-=40
set burn=1
if %status%==Sleeping (set status=Burned+Sleeping) else (set status=Burned)
GOTO Attack

:SURF
if %playermana% LSS 30 GOTO Skills
set /a playermana-=30
set skilldmg=20
if %burn% GTR 0 if %stuncount% GTR 0 (set burn=0) & (set status=Sleeping) else (set burn=0) & set status=None
GOTO Attack

:AIMED
if %playermana% LSS 30 GOTO Skills
set /a playermana-=30
set skilldmg=50
GOTO Attack

::Equips and stuff

:EQUIPSTATS
set padddmg=0
if %wepe%==wsword set padddmg=5
if %wepe%==wstaff set padddmg=3
if %wepe%==wsbow set padddmg=4
if %shielde%==wshield set parmor=3
GOTO TheGame

:TUTORIAL
cls
echo                           Tutorial
echo -------------------------------------------------------------------------------
echo Type "play" in the menu to play.
echo.
echo The difficulty changes the health of the opponent.
echo.
echo Weak health potions heal 50 health.
echo.
echo Strong health potions heal 100 health.
echo.
echo Super health potions heal 250 health.
echo.
echo Weak mana potions heal 40 mana.
echo.
echo Strong mana potions heals 80 mana.
echo.
echo Super mana potions heals 100 mana.
echo.
echo If your opponent runs out of health, you win!
echo.
echo If YOU run out of health, you lose.
echo.
echo If your base damage is the same as the critical number
echo your damage for that attack will be multiplied by 10.
echo.
echo Your base damage, and critical hit is shown to the right of your name.
echo.
echo Your opponent can hit criticals too.
echo.
echo Double attack hits twice but is weaker each hit.
echo.
echo Stun attack stuns the enemy for 2 turns.
echo.
echo Who even reads the tutorial?
echo.
echo If you're reading this, here's a hint:
echo Use the name "Jozhus" for stupidly high damage.
echo.
echo Scroll up for more stuff.
echo.
pause
GOTO MENU

:RANDOM
set /a rnd=(%random%*%rndmax%)/32768
if %currlabel%==easy GOTO EasyCon
if %currlabel%==medium GOTO MediumCon
if %currlabel%==hard GOTO HardCon
if %currlabel%==speeddecider GOTO SpeedDecider
if %currlabel%==pattack GOTO PAttack
if %currlabel%==pcrit GOTO PCrit
if %currlabel%==monattack GOTO MonAttack
if %currlabel%==moncrit GOTO MonCrit

:WIN
cls
color 07
set /a wincount+=1
set /a scoremultiplyer+=1
echo.
echo.
echo.
echo.
echo.
echo                                    YOU WIN!
echo.
echo                                  Total Win: %wincount%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
GOTO Again

:LOSE
cls
set /a scoremultiplyer=%scoremultiplyer%*1250
set /a score=%wincount%*%scoremultiplyer%
if %diff%==easy set /a score=%score%*1
if %diff%==medium set /a score=%score%*3
if %diff%==hard set /a score=%score%*5
set wincounter=0
echo.
echo.
echo.
echo.
echo.
echo                                   YOU LOSE!
echo.
echo                                   Score: %score%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
GOTO Menu

:AGAIN
set again=0
cls
echo.
echo.
echo.
echo.
echo.
echo                                  Continue?
echo.
echo                                  Yes / No
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
set /p again=Choice: 
If /i %again%==yes GOTO Yes
if /i %again%==no EXIT
GOTO Again

:YES
set /a roundcount+=1
set burn=0
set stuncount=0
set notround1=1
set /a mspeed+=1
set speedcheck=1
GOTO Diff