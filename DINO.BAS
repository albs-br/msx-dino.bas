
0RESTORE:DEFINTb-z:KEYOFF:SCREEN1,2,0:y=128:m=-1:s=0:ONSPRITEGOSUB7:SPRITEON			'Initialization
1FORi=0TO68:VPOKE6688+(iAND31),0:READa$:VPOKE14343+i,VAL("&H"+a$):NEXT			'Initialization (cont.)
2f(0)=1:f(1)=4:f(2)=16:f(3)=64:DATA4,6,7,23,73,FF,7,3,1,0,0,0,0,0,0,0,0,0,0,80	'Initialization (cont.)
3VPOKE6,f(sAND3):IFy<81THENj=3ELSEIFy=128THENj=STRIG(0)*3 						'Floor animation/Jump
4IFm<0THENn=(INT(RND(1)*3)*16)+96:BEEP:f=1:b=15:v=s/100:IFv>3THENv=4:f=15:b=1	'Enemy respawn 'debug:b=s/100 ; prod:b=s/999
5IFm<0THENm=255:LOCATE22,1:?s:COLORf,b,4:p=0:IFn=128THENp=sAND2
6PUTSPRITE0,(32,y),f,1:y=y+j:PUTSPRITE1,(m,n),f,p:s=s+1:m=m-(v+2):GOTO3 		'Gameplay
7LOCATE22,1:?s:LOCATE11,11:?"GaMeOvEr":PLAY"DFDA":FORi=0TO3000:NEXT:SPRITEOFF 	'Collision
8RETURN0:DATAC0,E0,FF,F8,FE,0,0,0,0,0,20,20,31,3F,1F,F,7,7,6,4,6,1E,2F,3F,38
9DATA3F,78,F8,FE,F8,F0,F0,E0,C0,80,80,C0,18,1B,DB,DB,DB,DE,7C,38,18,18,18,18

100 '-------------------------------------------------------------------------|    <--- 80 chars wide ruler

1000 ' ------- Variables:
1010 ' y	Player Y
1020 ' j	Player jump (0;-3;3)
1030 ' m,n	Enemy X,Y
1035 ' p	Enemy pattern (0:bird; 2:cactus)
1040 ' s	Score
1050 ' v	temp var for game speed (2-6)
1055 ' f(n) floor pattern; f(0) to f(3)
1057 ' f	foreground color
1058 ' b	background color
1060 '
1070 ' Y=128:J=0:M=-1:N=0:S=0:V=2	'remove vars init to zero (default)

2000 ' ------ Backlog:
2010 ' Dino and bird animation
2020 ' Floor with animation		OK
2025 ' Cactus/enemy respawn		OK
2030 ' Transition day/night		OK
2040 ' High score 
2050 ' End game					OK

3000 ' ----- Screen 1 VRAM mapping:
3010 ' NAMTBL: 6144
3020 ' PATTBL: 0
3030 ' SPRATR: 6912
3040 ' SPRPAT: 14336