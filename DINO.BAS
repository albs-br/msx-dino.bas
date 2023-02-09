
0DEFINTb-z:KEYOFF:COLOR1,15,4:SCREEN1,2,0:y=128:m=-1:FORi=0TO31:VPOKE6688+i,0:NEXT		 	'Initialization
1FORi=0TO75:READa$:VPOKE14336+i,VAL("&H"+a$):NEXT:ONSPRITEGOSUB5:SPRITEON:f(0)=1:f(1)=4:f(2)=16:f(3)=64		'Initialization (cont.)
2VPOKE6,f(sAND3):IFy<81THENj=3ELSEIFy=128THENj=0:IFSTRIG(0)=-1THENj=-3 						 	'Jump
3IFm<0THENm=255:n=(INT(RND(1)*3)*16)+96:BEEP:LOCATE22,1:?s:b=s/100:IFb>3THENb=4	'Enemy respawn 'debug:b=s/100 ; prod:b=s/999
4PUTSPRITE0,(32,y),1,0:y=y+j:PUTSPRITE1,(m,n),1,1:s=s+1:m=m-(b+2):GOTO2 		'Gameplay
5LOCATE22,1:?s:LOCATE9,11:?"New game? Y/N":IFINKEY$=CHR$(28)THENRETURNELSE5 	'Collision
7DATA0,0,0,0,0,20,20,31,3F,1F,0F,7,7,6,4,6,1E,2F,3F,38,3F,78,F8,FE,F8,F0,F0,E0
8DATAC0,80,80,C0,4,6,7,23,73,FF,7,3,1,0,0,0,0,0,0,0,0,0,0,80,C0,E0,FF,F8,FE,0
9DATA0,0,0,0,0,0,18,1B,DB,DB,DB,DE,7C,38,18,18,18,18

100 '-------------------------------------------------------------------------|    <--- 80 chars wide ruler

1000 ' ------- Variables:
1010 ' y	Player Y
1020 ' j	Player jump (0;-3;3)
1030 ' m,n	Enemy X,Y
1040 ' s	Score
1050 ' b	temp var for game speed (2-6)
1055 ' f(n) floor pattern; f(0) to f(3)
1060 '
1070 ' Y=128:J=0:M=-1:N=0:S=0:V=2	'remove vars init to zero (default)

2000 ' ------ Backlog:
2010 ' Dino and bird animation
2020 ' Floor with animation
2025 ' Cactus/enemy respawn
2030 ' Transition day/night
2040 ' High score 

3000 ' ----- Screen 1 VRAM mapping:
3010 ' NAMTBL: 6144
3020 ' PATTBL: 0
3030 ' SPRATR: 6912
3040 ' SPRPAT: 14336