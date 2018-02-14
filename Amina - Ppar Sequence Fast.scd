(
var a,b,c,d,e,f,g,h,i,j,k,l,m,mm,n,o,p,pp,ppp,pppp,q,r,t,u,v,w,x,y,z,tempo,out;
tempo=TempoClock(130*64/60);


a=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, Pwhite(0.2,0.7),
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\ring,
	\vol1, 0.6,
	\mfreq1, 600,
	\mfreq2, 600,
	\voldecay, 0.03,
		\dur, Pseq([1,Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),]))]);


b=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(1),1,Rest(1),Rest(12)])),

	Pbind(\instrument,\ring,
	\vol1, Pwhite(0.2,0.9),
	\voldecay, 0.05,
		\dur, Pseq([1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),1,Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(15)]),
	\fltr1, 3000,
	\voldecay, Pwhite(0.07,0.1,inf),
	\pan, 0,
	\trem, 200)]);


c=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(1),1,Rest(13)])),

	Pbind(\instrument,\ring,
	\vol1, 0.2,
	\mfreq1, Pwhite(900,1500),
	\mfreq2, Pwhite(900,1500),
	\voldecay, 0.03,
	\dur, Pseq([1,Rest(7),1,Rest(7)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,1,1,1,Rest(12)]),
	\fltr1, 3000,
	\voldecay, 0.01,
	\pan, 0,
	\trem, 500),

	Pbind(\instrument,\kick,
	\freq1, 4000,
	\freq2, 480,
	\voldecay, 0.02,
	\vol1, Pwhite(0.1,0.5),
	\dur, Pseq([1,1,1,1,Rest(4),1,1,1,1,Rest(4)]))]);


d=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 40,
	\vol1, Pwhite(0.2,0.6),
	\voldecay, 0.03,
	\dur, Pseq([1,1,1,1,Rest(12)])),

	Pbind(\instrument,\ring,
	\mfreq1, 600,
	\mfreq2, 600,
	\vol1, Pwhite(0.1,0.8),
	\voldecay, 0.05,
	\dur, Pseq([Rest(8),1,1,1,1,1,1,1,1])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(1),1,Rest(1),1,Rest(1),1,Rest(9)]),
	\fltr1, 3000,
	\voldecay, 0.1,
	\pan, 0,
	\trem, 500),

	Pbind(\instrument,\kick,
	\freq1, 4000,
	\freq2, Pwhite(480,960),
	\voldecay, 0.02,
	\vol1, 0.1,
	\dur, Pseq([1,Rest(7),1,Rest(7)]))]);


e=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, Pwhite(0.2,0.6),
	\voldecay, 0.2,
	\dur, Pseq([1,Rest(7),1,Rest(7)])),

	Pbind(\instrument,\ring,
	\vol1, 0.2,
	\mfreq1, 1200,
	\mfreq2, 1200,
	\voldecay, 0.04,
	\pan, Pwhite(-1,1),
	\dur, Pseq([1,Rest(1),1,Rest(1),1,Rest(1),1,Rest(9)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(7),1,Rest(7)]),
	\fltr1, 3000,
	\voldecay, 0.05,
	\pan, 0,
	\trem, 500),

	Pbind(\instrument,\kick,
	\freq1, 4000,
	\freq2, Pwhite(480,960),
	\voldecay, 0.02,
	\vol1, 0.1,
	\dur, Pseq([1,1,1,1,Rest(4),1,1,1,1,Rest(4)])),

	Pbind(\instrument,\hh,
	\vol1, 0.04,
	\voldecay, Pwhite(0.05,0.025,inf),
	\trem, 0,
	\pan, Pwhite(-0.5,0.5),
	\dur, Pseq([1,Rest(3)],4))]);


f=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(1),1,Rest(1),Rest(12)])),

	Pbind(\instrument,\simpleSquare,
	\vol1, 0.8,
	\freq1, Pseq([880,Rest(3),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([880,Rest(3),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\fltr2, 3000,
	\pan, Pwhite(-1,1),
	\dur, Pseq([1,Rest(3),1,Rest(3),1,Rest(1),1,Rest(1),1,Rest(3)]))]);


g=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(7),1,Rest(7)])),

	Pbind(\instrument,\simpleSaw,
	\freq1, Pseq([880,Rest(3),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([880,Rest(3),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\fltr2, 3000,
	\dur, Pseq([1,Rest(3),1,Rest(3),1,Rest(1),1,Rest(1),1,Rest(3)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([Rest(8),1,Rest(7)]),
	\fltr1, 3000,
	\voldecay, 0.05,
	\pan, 0,
	\trem, 500)]);


h=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])),

	Pbind(\instrument,\simpleSquare,
	\vol1, 0.8,
	\fltr1, Pseq([2000,Rest(0.5),3000,Rest(0.5),4000,Rest(0.5),5000,Rest(0.5),100,Rest(3),100,Rest(3),100,Rest(3)]),
	\fltr2, Pseq([100,Rest(0.5),100,Rest(0.5),100,Rest(0.5),100,Rest(0.5),1000,Rest(3),1000,Rest(3),1000,Rest(3)]),
	\freq1, Pseq([1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\voldecay, Pseq([0.05,Rest(0.5),0.05,Rest(0.5),0.05,Rest(0.5),0.05,Rest(0.5),1,Rest(3),1,Rest(3),1,Rest(3)]),
	\pan, Pwhite(-0.7,0.7),
	\dur, Pseq([0.5,Rest(15.5)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([Rest(8),1,Rest(7)]),
	\fltr1, 3000,
	\voldecay, 0.05,
	\pan, 0,
	\trem, 500)]);


i=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(7),1,Rest(7)])),

	Pbind(\instrument,\simpleSaw,
	\freq1, Pseq([Pwhite(880,920),Rest(3),Pwhite(660,700),Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([Pwhite(880,920),Rest(3),Pwhite(880,920),Rest(3),760,Rest(3),700,Rest(3)]),
	\fltr2, 3000,
	\pan, -1,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([Rest(8),1,Rest(7)]),
	\fltr1, 3000,
	\voldecay, 0.05,
	\pan, 0,
	\trem, 500)]);


j=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.2,
	\voldecay, 0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSquare,
	\vol1, 0.8,
	\fltr1, Pseq([3000,Rest(0.5),3000,Rest(0.5),3000,Rest(0.5),3000,Rest(0.5),1500,Rest(3),1500,Rest(3),1500,Rest(3)]),
	\fltr2, Pseq([1500,Rest(0.5),1500,Rest(0.5),1500,Rest(0.5),1500,Rest(0.5),1000,Rest(3),1000,Rest(3),1000,Rest(3)]),
	\freq1, Pseq([Pwhite(3760,7000),Rest(0.5),Pwhite(4760,8000),Rest(0.5),Pwhite(1760,4000),Rest(0.5),Pwhite(1760,4000),Rest(0.5),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([3760,Rest(0.5),5760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\voldecay, Pseq([0.05,Rest(0.5),0.05,Rest(0.5),0.05,Rest(0.5),0.05,Rest(0.5),1,Rest(3),1,Rest(3),1,Rest(3)]),
	\pan, 1,
	\dur, Pseq([0.5,Rest(15.5)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([Rest(8),1,Rest(7)]),
	\fltr1, 3000,
	\voldecay, 0.05,
	\pan, 0,
	\trem, 500)]);


k=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.2,
	\voldecay, Pwhite(0.05,0.2),
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSaw,
	\vol1, 0.6,
	\freq1, Pseq([Pwhite(660,7780),Rest(15)]),
	\freq2, Pseq([7780,Rest(15)]),
	\fltr2, 3000,
	\pan, 0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(15)]),
	\fltr1, 2500,
	\voldecay, 0.02,
	\pan, 0,
	\trem, 500)]);


l=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, Pwhite(100,5000),
	\vol1, Pwhite(0.1,0.6),
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSquare,
	\freq1, Pseq([Pwhite(5760,9840),Rest(15)]),
	\freq2, Pseq([Pwhite(5760,9840),Rest(15)]),
	\freqdecay, Pwhite(0.2,1),
	\fltr2, 5000,
	\pan, -0.4,
	\dur, Pseq([1,Rest(7),1,Rest(7)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(15)]),
	\fltr1, 3000,
	\voldecay, 0.02,
	\pan, 0,
	\trem, 500)]);


m=Ppar([
	Pbind(\instrument,\wobble,
	\vol1, 0.6,
	\dur, Pseq([1,Rest(31)]),
	\voldecay, Pwhite(0.1,0.3),
	\pfreq2, Pwhite(1500,6500),
	\pfreqdecay, 0.05)]);


mm=Ppar([
	Pbind(\instrument,\wobble,
	\vol1, 0.6,
	\dur, Pseq([1,Rest(31)]),
	\pfreq2, 2000,
	\pfreqdecay, 0.02,
	\voldecay, 0.1)]);


n=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, Pxrand([660,880,1320,1760,2640]),
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSquare,
	\vol1, Pwhite(0.3,0.7),
	\freq1, Pseq([Pxrand([660,880]),Rest(3),Pwhite(1320,1400),Rest(3),1520,Rest(3),1400,Rest(3)]),
	\freq2, Pseq([Pwhite(1760,1840),Rest(3),Pwhite(1760,1840),Rest(3),1520,Rest(3),1400,Rest(3)]),
	\fltr2, 5000,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(15)]),
	\fltr1, 3000,
	\voldecay, 0.03,
	\pan, 0,
	\trem, 500)]);


o=Ppar([
	Pbind(\instrument, \ring,
	\mfreq1, Pwhite(300,600),
	\mfreq2, Pwhite(300,600),
	\vol1, Pwhite(0.05,1),
	\voldecay, 0.02,
	\dur, Pseq([1,Rest(15)]))]);


p=Ppar([
	Pbind(\instrument, \kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.5,
	\voldecay, 0.5,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSaw,
	\vol1, 0.5,
	\freq1, 660,
	\freq2, 660,
	\fltr2, 3000,
	\pan, 0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSquare,
	\vol1, 0.5,
	\freq1, 880,
	\freq2, 880,
	\fltr2, 3000,
	\pan, -0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(15)]),
	\fltr1, 15000,
	\fltr2, 13000,
	\voldecay, 0.02,
	\pan, 0,
	\trem, 800)]);

pp=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.5,
	\voldecay, 0.5,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSaw,
	\vol1, 0.5,
	\freq1, 740,
	\freq2, 740,
	\fltr2, 3000,
	\pan, 0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSquare,
	\vol1, 0.5,
	\freq1, 880,
	\freq2, 880,
	\fltr2, 3000,
	\pan, -0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(15)]),
	\fltr1, 15000,
	\fltr2, 13000,
	\voldecay, 0.02,
	\pan, 0,
	\trem, 800)]);

ppp=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.5,
	\voldecay, 0.5,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSaw,
	\vol1, 0.5,
	\freq1, 1320,
	\freq2, 1320,
	\fltr2, 3000,
	\pan, 0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSquare,
	\vol1, 0.5,
	\freq1, 730,
	\freq2, 7300,
	\fltr2, 3000,
	\pan, -0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(15)]),
	\fltr1, 15000,
	\fltr2, 13000,
	\voldecay, 0.02,
	\pan, 0,
	\trem, 800)]);


pppp=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.5,
	\voldecay, 0.5,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSaw,
	\vol1, 0.5,
	\freq1, 2320,
	\freq2, 2320,
	\fltr2, 3000,
	\pan, 0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\simpleSquare,
	\vol1, 0.5,
	\freq1, 730,
	\freq2, 1730,
	\freqdecay, 1,
	\fltr2, 3000,
	\pan, -0.4,
	\dur, Pseq([1,Rest(15)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([1,Rest(15)]),
	\fltr1, 15000,
	\fltr2, 13000,
	\voldecay, 0.02,
	\pan, 0,
	\trem, 800)]);


out=Pseq([
	Pxrand([
	Pseq([l,l,l,l,l,l,l,l]),
	Pseq([j,Rest(16),m,j,Rest(16),m,k,k]),
	Pseq([m,Rest(7),e,Rest(3),e,Rest(3)],3),
	Pseq([mm,Rest(7),e,Rest(3),e,Rest(3)],3),
	Pseq([m,Rest(7),e,Rest(3),e,Rest(3)]),
	Pseq([e,Rest(15)],7),
	Pseq([e,Rest(7)],2),
	Pseq([m,Rest(7),e,Rest(3),e,Rest(3)],3),
	Pseq([mm,Rest(7),e,Rest(3),e,Rest(3)],3),
	Pseq([Pxrand([a,b,l,Rest(1),e,l,g,Rest(1),l,j,k,Rest(1),m,n,l,l])],32),
	Pseq([m,m,m,Rest(5),e,d,e,d,e,d,e,d]),
	Pseq([mm,Rest(7),e,d,e,d,e,d,e,d]),
	Pseq([m,Rest(7),e,d,e,d,e,d,e,d]),
	Pseq([l,Rest(15)],8),
	Pseq([j,Rest(127)],8),
	Pseq([f,Rest(1),a,Rest(1),h,Rest(1),a,Rest(1)],3),
	Pseq([l,Rest(1),a,Rest(1),f,Rest(1),f,Rest(1)],1),
	Pseq([f,Rest(1),d,Rest(1)],7),
	Pseq([f,Rest(1),f,Rest(1)],1),
	Pseq([i,Rest(63)],4),
	Pseq([i,Rest(3),i,Rest(3),l,Rest(7)],8),
	Pseq([e,a,c,a,l,Rest(7)],8),
	Pseq([m,Rest(1),f,Rest(1),e,Rest(7)],8),
	Pseq([mm,Rest(1),f,Rest(1),e,Rest(7)],8),
	Pseq([n,l,n,l,e,Rest(1),e,Rest(1)],4),
	Pseq([a],32),
	Pseq([j,o,j,o,j,o,j,k],4),
	Pseq([o],8),
	Pseq([l,Rest(63)]),
	Pseq([e,Rest(15)],16),
	Pseq([Pxrand([a,b,c,Rest(1),e,f,g,Rest(1),i,j,k,Rest(1),m,n,l,g])],32),
	Pseq([a,a,b,a],2),
	Pseq([c,c,c,d],2),
	Pseq([e,e,e,d],2),
	Pseq([f,a,f,a],2),
	Pseq([g,k,g,h],1),
	Pseq([l,g,g,h],1),
	Pseq([g,i,g,j],1),
	Pseq([g,i,k,h],1),
	Pseq([m,Rest(63)],2),
	],32),
	Pxrand([
    Pseq([p,Rest(63),k,Rest(63),k,Rest(63),k,Rest(63),pp,Rest(63),k,Rest(63),k,Rest(63),k,Rest(63),ppp,Rest(63),k,Rest(63),k,Rest(63),k,Rest(63),pppp,Rest(63),k,Rest(63),k,Rest(63),k,Rest(63)]),
	Pseq([k,Rest(63),k,Rest(63),k,Rest(63),k,Rest(63),l,Rest(63),k,Rest(63),k,Rest(63),k,Rest(63)]),
    Pseq([k,Rest(31),e,Rest(31),k,Rest(63),k,Rest(63),k,Rest(63),o,Rest(31),o,Rest(31),k,Rest(63),k,Rest(63),k,Rest(63)]),
	],4),
	Pxrand([
	Pseq([l,l,l,l,l,l,l,l]),
	Pseq([j,Rest(16),m,j,Rest(16),m,k,k]),
	Pseq([m,Rest(7),e,Rest(3),e,Rest(3)],3),
	Pseq([mm,Rest(7),e,Rest(3),e,Rest(3)],3),
	Pseq([m,Rest(7),e,Rest(3),e,Rest(3)]),
	Pseq([e,Rest(15)],7),
	Pseq([e,Rest(7)],2),
	Pseq([m,Rest(7),e,Rest(3),e,Rest(3)],3),
	Pseq([mm,Rest(7),e,Rest(3),e,Rest(3)],3),
	Pseq([Pxrand([a,b,l,Rest(1),e,l,g,Rest(1),l,j,k,Rest(1),m,n,l,l])],32),
	Pseq([m,m,m,Rest(5),e,d,e,d,e,d,e,d]),
	Pseq([mm,Rest(7),e,d,e,d,e,d,e,d]),
	Pseq([m,Rest(7),e,d,e,d,e,d,e,d]),
	Pseq([l,Rest(15)],8),
	Pseq([j,Rest(127)],8),
	Pseq([f,Rest(1),a,Rest(1),h,Rest(1),a,Rest(1)],3),
	Pseq([l,Rest(1),a,Rest(1),f,Rest(1),f,Rest(1)],1),
	Pseq([f,Rest(1),d,Rest(1)],7),
	Pseq([f,Rest(1),f,Rest(1)],1),
	Pseq([i,Rest(63)],4),
	Pseq([i,Rest(3),i,Rest(3),l,Rest(7)],8),
	Pseq([e,a,c,a,l,Rest(7)],8),
	Pseq([m,Rest(1),f,Rest(1),e,Rest(7)],8),
	Pseq([mm,Rest(1),f,Rest(1),e,Rest(7)],8),
	Pseq([n,l,n,l,e,Rest(1),e,Rest(1)],4),
	Pseq([a],32),
	Pseq([j,o,j,o,j,o,j,k],4),
	Pseq([o],8),
	Pseq([l,Rest(63)]),
	Pseq([e,Rest(15)],16),
	Pseq([Pxrand([a,b,c,Rest(1),e,f,g,Rest(1),i,j,k,Rest(1),m,n,l,g])],32),
	Pseq([a,a,b,a],2),
	Pseq([c,c,c,d],2),
	Pseq([e,e,e,d],2),
	Pseq([f,a,f,a],2),
	Pseq([g,k,g,h],1),
	Pseq([l,g,g,h],1),
	Pseq([g,i,g,j],1),
	Pseq([g,i,k,h],1),
	Pseq([m,Rest(63)],2),
	Pseq([k,Rest(63),k,Rest(63),k,Rest(63),k,Rest(63),l,Rest(63),k,Rest(63),k,Rest(63),k,Rest(63)])
	],24)
]);
out.play(tempo);
)
