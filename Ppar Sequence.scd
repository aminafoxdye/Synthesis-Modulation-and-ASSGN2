(
var a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,t,u,v,w,x,y,z,tempo,out;
tempo=TempoClock(145*4/60);


a=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.3,
	\dur, Pseq([1,Rest(1),1,Rest(1),Rest(12)])),

	Pbind(\instrument,\ring,
	\vol1, 0.6,
	\mfreq1, 600,
	\mfreq2, 600,
	\voldecay, 0.03,
	\dur, Pseq([1,Rest(1),Rest(1),1,Rest(1),Rest(1),1,Rest(1),1,Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),]))]);


b=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.3,
	\dur, Pseq([1,Rest(1),1,Rest(1),Rest(12)])),

	Pbind(\instrument,\ring,
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(1),Rest(1),1,Rest(1),Rest(1),1,Rest(1),1,Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([Rest(4),1,Rest(3),Rest(4),1,Rest(3)]),
	\fltr1, 3000,
	\voldecay, Pwhite(0.07,0.1,inf),
	\pan, 0,
	\trem, 200)]);


c=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.7,
	\dur, Pseq([1,Rest(1),1,Rest(1),Rest(2),1,Rest(1),1,Rest(3),1,Rest(3)])),

	Pbind(\instrument,\ring,
	\vol1, 0.6,
	\mfreq1, Pwhite(900,1500),
	\mfreq2, Pwhite(900,1500),
	\voldecay, 0.03,
	\dur, Pseq([1,Rest(1),1,1,Rest(2),1,Rest(1),1,Rest(3),1,Rest(3),])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([Rest(4),1,Rest(3),Rest(4),1,Rest(3)]),
	\fltr1, 3000,
	\voldecay, 0.1,
	\pan, 0,
	\trem, 500),

	Pbind(\instrument,\kick,
	\freq1, 4000,
	\freq2, 480,
	\voldecay, 0.02,
	\vol1, 0.1,
	\dur, Pseq([Rest(1),1,Rest(1),1,1,1,Rest(4),1,1,1,1,1,Rest(1)]))]);


d=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 40,
	\vol1, 0.6,
	\voldecay, 0.03,
	\dur, Pseq([1,Rest(1),1,Rest(1),Rest(2),1,Rest(1),1,Rest(3),1,Rest(3)])),

	Pbind(\instrument,\ring,
	\mfreq1, 600,
	\mfreq2, 600,
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(1),Rest(1),1,Rest(1),Rest(1),1,Rest(1),1,Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([Rest(4),1,Rest(3),Rest(4),1,Rest(3)]),
	\fltr1, 3000,
	\voldecay, 0.1,
	\pan, 0,
	\trem, 500),

	Pbind(\instrument,\kick,
	\freq1, 4000,
	\freq2, Pwhite(480,960),
	\voldecay, 0.02,
	\vol1, 0.1,
		\dur, Pseq([Rest(1),1,Rest(1),1,1,1,Rest(4),1,1,1,1,1,Rest(1)]))]);


e=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.7,
	\dur, Pseq([1,Rest(1),1,Rest(1),Rest(2),1,Rest(1),1,Rest(3),1,Rest(3)])),

	Pbind(\instrument,\ring,
	\vol1, 0.6,
	\mfreq1, 1200,
	\mfreq2, 1200,
	\voldecay, 0.04,
	\dur, Pseq([1,Rest(1),1,1,Rest(2),1,Rest(1),1,Rest(3),1,Rest(3),])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([Rest(4),1,Rest(3),Rest(4),1,Rest(3)]),
	\fltr1, 3000,
	\voldecay, 0.05,
	\pan, 0,
	\trem, 500),

	Pbind(\instrument,\kick,
	\freq1, 4000,
	\freq2, Pwhite(480,960),
	\voldecay, 0.02,
	\vol1, 0.1,
	\dur, Pseq([Rest(1),1,Rest(1),1,1,1,Rest(4),1,1,1,1,1,Rest(1)])),

	Pbind(\instrument,\hh,
	\vol1, 0.08,
	\voldecay, Pwhite(0.1,0.025,inf),
	\trem, 0,
	\pan, Pwhite(-0.5,0.5),
	\dur, Pseq([Rest(2),1,Rest(1)],4))]);


f=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.05,
	\dur, Pseq([1,Rest(1),1,Rest(1),Rest(12)])),

	Pbind(\instrument,\simpleSaw,
	\vol1, 0.8,
	\freq1, Pseq([880,Rest(3),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([880,Rest(3),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\fltr2, 3000,
	\dur, Pseq([1,Rest(3),1,Rest(3),1,Rest(1),1,Rest(1),1,Rest(3)]))]);


g=Ppar([
	Pbind(\instrument,\kick,
	\freq1, 12000,
	\freq2, 60,
	\vol1, 0.6,
	\voldecay, 0.7,
	\dur, Pseq([1,Rest(2),1,Rest(2),1,Rest(1),1,Rest(2),1,Rest(2),1,Rest(1)])),

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
	\voldecay, 0.7,
	\dur, Pseq([1,Rest(2),1,Rest(2),1,Rest(1),1,Rest(2),1,Rest(2),1,Rest(1)])),

	Pbind(\instrument,\simpleSaw,
	\vol1, 0.8,
	\fltr1, Pseq([2000,Rest(0.5),3000,Rest(0.5),4000,Rest(0.5),5000,Rest(0.5),100,Rest(3),100,Rest(3),100,Rest(3)]),
	\fltr2, Pseq([100,Rest(0.5),100,Rest(0.5),100,Rest(0.5),100,Rest(0.5),1000,Rest(3),1000,Rest(3),1000,Rest(3)]),
	\freq1, Pseq([1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\voldecay, Pseq([0.05,Rest(0.5),0.05,Rest(0.5),0.05,Rest(0.5),0.05,Rest(0.5),1,Rest(3),1,Rest(3),1,Rest(3)]),
	\dur, Pseq([0.5,Rest(0.5),0.5,Rest(0.5),0.5,Rest(0.5),0.5,Rest(0.5),1,Rest(3),1,Rest(1),1,Rest(1),1,Rest(3)])),

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
	\voldecay, 0.7,
	\dur, Pseq([1,Rest(2),1,Rest(2),1,Rest(1),1,Rest(2),1,Rest(2),1,Rest(1)])),

	Pbind(\instrument,\simpleSaw,
		\freq1, Pseq([Pwhite(880,920),Rest(3),Pwhite(660,700),Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([Pwhite(880,920),Rest(3),Pwhite(880,920),Rest(3),760,Rest(3),700,Rest(3)]),
	\fltr2, 3000,
	\dur, Pseq([1,Rest(3),1,Rest(3),1,Rest(1),1,Rest(1),1,Rest(3)])),

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
	\vol1, 0.6,
	\voldecay, 0.7,
	\dur, Pseq([1,Rest(2),1,Rest(2),1,Rest(1),1,Rest(2),1,Rest(2),1,Rest(1)])),

	Pbind(\instrument,\simpleSaw,
	\vol1, 0.8,
		\fltr1, Pseq([3000,Rest(0.5),3000,Rest(0.5),3000,Rest(0.5),3000,Rest(0.5),1500,Rest(3),1500,Rest(3),1500,Rest(3)]),
	\fltr2, Pseq([1500,Rest(0.5),1500,Rest(0.5),1500,Rest(0.5),1500,Rest(0.5),1000,Rest(3),1000,Rest(3),1000,Rest(3)]),
			\freq1, Pseq([Pwhite(1760,2000),Rest(0.5),Pwhite(1760,2000),Rest(0.5),Pwhite(1760,2000),Rest(0.5),Pwhite(1760,2000),Rest(0.5),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),1760,Rest(0.5),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\voldecay, Pseq([0.05,Rest(0.5),0.05,Rest(0.5),0.05,Rest(0.5),0.05,Rest(0.5),1,Rest(3),1,Rest(3),1,Rest(3)]),
	\dur, Pseq([0.5,Rest(0.5),0.5,Rest(0.5),0.5,Rest(0.5),0.5,Rest(0.5),1,Rest(3),1,Rest(1),1,Rest(1),1,Rest(3)])),

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
	\vol1, 0.6,
	\voldecay, 0.7,
	\dur, Pseq([1,Rest(2),1,Rest(2),1,Rest(1),1,Rest(2),1,Rest(2),1,Rest(1)])),

	Pbind(\instrument,\simpleSaw,
	\freq1, Pseq([880,Rest(3),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\freq2, Pseq([880,Rest(3),660,Rest(3),760,Rest(3),700,Rest(3)]),
	\fltr2, 3000,
	\dur, Pseq([1,Rest(3),1,Rest(3),1,Rest(1),1,Rest(1),1,Rest(3)])),

	Pbind(\instrument,\hh2,
	\dur, Pseq([Rest(8),1,1,Rest(1),1,Rest(4)]),
	\fltr1, 2500,
	\voldecay, 0.05,
	\pan, 0,
	\trem, 500)]);


out=Pseq([
	Pseq([a,a,b,a],2),
	Pseq([c,c,c,d],2),
	Pseq([e,e,e,d],2),
	Pseq([f,a,f,a],2),
	Pseq([g,k,g,h],1),
	Pseq([g,g,g,h],1),
	Pseq([g,i,g,j],1),
	Pseq([g,i,k,h],1),
]);
out.play(tempo);
)