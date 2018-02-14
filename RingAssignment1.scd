//Ring Synth Song
(
t=TempoClock(125*4/60);

Ppar([
Pbind(\instrument,\kick, //4onfloor
	\vol1, 0.7,
	\freq2, 50,
	\dur, Pseq([Pn(Rest(128),1),Pseq([1,Rest(1),Rest(1),Rest(1)],96)]);
),

Pbind(\instrument,\kick, //triplet
	\vol1, Pseq([Pn(Rest(512),1),Pseq([0.7,Rest(1),Rest(1)],40),Pseq([0.7,Rest(1),Rest(1),0.65,Rest(1),Rest(1),0.6,Rest(1),Rest(1),0.55,Rest(1),Rest(1),0.5,Rest(1),Rest(1),0.45,Rest(1),Rest(1),0.4,Rest(1),Rest(1),0.35,Rest(1),Rest(1),0.3,Rest(1),Rest(1),0.25,Rest(1),Rest(1),0.2,Rest(1),Rest(1),0.15,Rest(1),Rest(1),0.1,Rest(1),Rest(1),0.05,Rest(1),Rest(1),0.03,Rest(1),Rest(1),0.01,Rest(1),Rest(1)],1)]),
	\freq2, 50,
	\dur, Pseq([Pn(Rest(512),1),Pseq([1,Rest(1),Rest(1)],56)]);
),

Pbind(\instrument,\hh, //high hat
	\vol1, 0.08,
	\voldecay, Pwhite(0.1,0.025,inf),
	\trem, 0,
	\pan, -0.6,
	\dur, Pseq([Pn(Rest(32),1),Pseq([1,Rest(1),Rest(1),],32),Pn(Rest(32),1),Pseq([1,Rest(1),],48),],2);
),

Pbind(\instrument,\hh2, //snare L
	\dur, Pseq([Pn(Rest(264.1),1),Pseq([Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1)],50)]),
	\fltr1, 5000,
	\voldecay, Pwhite(0.01,0.08,inf),
	\pan, -1,
	\trem, 100;
),

Pbind(\instrument,\hh2, //snare R
	\dur, Pseq([Pn(Rest(264.2),1),Pseq([Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1)],50)]),
	\fltr1, 4000,
	\voldecay, Pwhite(0.01,0.08,inf),
	\pan, 1,
	\trem, 100;
),

Pbind(\instrument,\hh2, //snare C
	\dur, Pseq([Pn(Rest(264),1),Pseq([Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1)],56)]),
	\fltr1, 3000,
	\voldecay, Pwhite(0.07,0.1,inf),
	\pan, 0,
	\trem, 200;
),

Pbind(\instrument,\hh2, //ride
	\vol1, 0.05,
	\vol2, 0,
	\fltr1, 19000,
	\fltr2, 15000,
	\fltrdecay, 3,
	\voldecay, 1,
	\trem, 0,
	\pan, 0.6,
	\dur, Pseq([Rest(384),Pseq([Rest(1),Rest(1),1,Rest(1)],32)]);
),

Pbind(\instrument,\ring, //low
	\mfreqdecay, 0.5,
	\mfreq1, Pseq([880,1200,700,400],inf),
	\mfreq2, Pseq([380,900,400,100],inf),
	\cfreqdecay, Pxrand([Pn(1,8),Pn(2,8),Pn(3,8)],inf),
	\cfreq1, 600,
	\cfreq2, 100,
	\vol1, 0.4,
	\voldecay, Pwhite(0.1,0.4,inf),
	\dur, Pseq([1,1,1,Rest(1),Rest(1),Rest(1)],88);
),

Pbind(\instrument,\ring, //high
	\mfreqdecay, 0.5,
	\mfreq1, Pseq([1500,1700,2700,2400,500],inf),
	\mfreq2, Pseq([600,900,400,1000,600],inf),
	\cfreqdecay, Pxrand([Pn(0.5,8),Pn(1,8),Pn(1.5,8)],inf),
	\cfreq1, 600,
	\cfreq2, 100,
	\trem, 1,
	\vol1, 0.3,
	\voldecay, Pwhite(0.1,0.2,inf),
	\dur, Pseq([Rest(256),Pseq([1,Rest(1),1,Rest(1),0.5,Rest(0.5),0.5,Rest(0.5)],70)]);
),

Pbind(\instrument,\simpleSaw, //entrance ramp
	\vol1, Pseq([Pn(Rest(536),1),0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4]),
	\freq1, Pseq([Pn(Rest(536),1),400,400,400,400,400,400,400,400]),
	\freq2, Pseq([Pn(Rest(536),1),400,400,400,400,400,400,400,400]),
	\voldecay, 0.3,
	\fltr1, 600,
	\fltr2, 600,
	\pan, Pseq([-1,1],inf),
	\dur, Pseq([Pn(Rest(536),1),1,1,1,1,1,1,1,1]);
),

Pbind(\instrument,\simpleSaw, //high
	\vol1, 0.6,
	\freq1, Pseq([Pn(Rest(544),1),Pseq([400,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),380,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Pwhite(330,350,1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),125,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),250,Rest(1),Rest(1),Rest(1),125,Rest(1),Rest(1),Rest(1)],28)]),
		\freq2, Pseq([Pn(Rest(544),1),Pseq([400,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),380,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Pwhite(330,350,1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),125,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),250,Rest(1),Rest(1),Rest(1),125,Rest(1),Rest(1),Rest(1)],28)]),
	\fltr1, Pseq([Pn(2000,1),Pseq([Pn(4000,32),Pn(3000,32),Pn(2000,32),Pn(1000,32)],inf)]),
	\fltr2, Pseq([Pn(2000,1),Pseq([Pn(4000,32),Pn(3000,32),Pn(2000,32),Pn(1000,32)],inf)]),
	\voldecay, 2,
			\dur, Pseq([Pn(Rest(544),1),Pseq([1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1)],inf)]),
),

Pbind(\instrument,\simpleSaw, //higher
	\vol1, 0.6,
				\freq1, Pseq([Pn(Rest(704),1),Pseq([Rest(1),800,1600,Rest(1),Rest(1),Rest(1),Rest(1),760,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Pwhite(650,700,1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),250,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),500,Rest(1),Rest(1),Rest(1),250,Rest(1),Rest(1)],24)]),
					\freq2, Pseq([Pn(Rest(704),1),Pseq([Rest(1),800,1600,Rest(1),Rest(1),Rest(1),Rest(1),760,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Pwhite(650,700,1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),250,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),500,Rest(1),Rest(1),Rest(1),250,Rest(1),Rest(1)],24)]),
	\fltr1, Pseq([Pn(4000,32),Pn(3000,32),Pn(2000,32),Pn(1000,32)],inf),
	\fltr2, Pseq([Pn(4000,32),Pn(3000,32),Pn(2000,32),Pn(1000,32)],inf),
	\voldecay, 2,
						\dur, Pseq([Pn(Rest(704),1),Pseq([Rest(1),1,1,Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1)],inf)]),
),

Pbind(\instrument,\simpleSaw, //highest
	\vol1, 0.6,
	\freq1, Pseq([Pn(Rest(832),1),Pseq([Rest(1),Rest(1),3200,6400,Rest(1),Rest(1),Rest(1),Rest(1),1520,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Pwhite(1300,1400,1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),500,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1000,Rest(1),Rest(1),Rest(1),250,Rest(1)],32)]),
	\freq2, Pseq([Pn(Rest(832),1),Pseq([Rest(1),Rest(1),3200,6400,Rest(1),Rest(1),Rest(1),Rest(1),1520,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Pwhite(1300,1400,1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),500,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1000,Rest(1),Rest(1),Rest(1),250,Rest(1)],32)]),
	\fltr1, Pseq([Pn(4000,32),Pn(3000,32),Pn(2000,32),Pn(1000,32)],inf),
	\fltr2, Pseq([Pn(4000,32),Pn(3000,32),Pn(2000,32),Pn(1000,32)],inf),
	\voldecay, 2,
	\dur, Pseq([Pn(Rest(832),1),Pseq([Rest(1),Rest(1),1,1,Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),1,Rest(1)],inf)]),
),

Pbind(\instrument,\wobble, //upward gesture
	\dur, Pseq([Pn(Rest(950),1),Pseq([Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(256)],2)]),
	\voldecay, 6,
	\cfreqdecay, 6,
	\vol1, 0.02,
	\cfreq1, 400,
	\pfreq1, 3000,
	\pfreq2, Pwhite (5500,8000,inf),
	\pfreqdecay, Pseq([Pn(Rest(950),1),Pseq([Rest(1),Rest(1),6,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1)])],2)
),

Pbind(\instrument,\kick, //kick 2nd entrance
		\vol1, Pseq([Pn(Rest(800),1),Pseq([0.7,Rest(1),Rest(1),Rest(1)],152),Pseq([0.7,Rest(1),Rest(1),Rest(1),0.65,Rest(1),Rest(1),Rest(1),0.6,Rest(1),Rest(1),Rest(1),0.55,Rest(1),Rest(1),Rest(1),0.5,Rest(1),Rest(1),Rest(1),0.45,Rest(1),Rest(1),Rest(1),0.4,Rest(1),Rest(1),Rest(1),0.35,Rest(1),Rest(1),Rest(1),0.3,Rest(1),Rest(1),Rest(1),0.25,Rest(1),Rest(1),Rest(1),0.2,Rest(1),Rest(1),Rest(1),0.15,Rest(1),Rest(1),Rest(1),0.1,Rest(1),Rest(1),Rest(1),0.05,Rest(1),Rest(1),Rest(1)],1)],1),
	\freq2, Pxrand([Pn(41.25,32),Pn(82.5,32),Pn(62.5,32)],28),
	\dur, Pseq([Pn(Rest(800),1),Pseq([1,Rest(1),Rest(1),Rest(1)],inf)]);
),

Pbind(\instrument,\kick, //kick 2nd entrance high
	\vol1, Pseq([Pn(Rest(800),1),Pseq([0.07,Rest(1),Rest(1),Rest(1)],152),Pseq([0.07,Rest(1),Rest(1),Rest(1),0.065,Rest(1),Rest(1),Rest(1),0.06,Rest(1),Rest(1),Rest(1),0.055,Rest(1),Rest(1),Rest(1),0.05,Rest(1),Rest(1),Rest(1),0.045,Rest(1),Rest(1),Rest(1),0.04,Rest(1),Rest(1),Rest(1),0.035,Rest(1),Rest(1),Rest(1),0.03,Rest(1),Rest(1),Rest(1),0.025,Rest(1),Rest(1),Rest(1),0.02,Rest(1),Rest(1),Rest(1),0.015,Rest(1),Rest(1),Rest(1),0.01,Rest(1),Rest(1),Rest(1),0.005,Rest(1),Rest(1),Rest(1)],1)],1),
	\freq2, Pxrand([Pn(41.25,32),Pn(82.5,32),Pn(62.5,32)]*2,24),
	\dur, Pseq([Pn(Rest(800),1),Pseq([1,Rest(1),Rest(1),Rest(1)],inf)]);
),

Pbind(\instrument,\hh2, //high hat 2nd entrance
	\vol1, 0.05,
	\vol2, 0,
	\fltr1, 16000,
	\fltr2, 12000,
	\fltrdecay, 3,
	\voldecay, Pseq([Pn(0.1,16),Pn(0.02,16)],inf),
	\trem, 0,
	\dur, Pseq([Pn(Rest(704),1),Pseq([Rest(1),Rest(1),1,Rest(1)],256)]);
),

Pbind(\instrument,\hh2, //high hat 2nd entrance
	\dur, Pseq([Pn(Rest(704),1),Pseq([Rest(1),Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1)],128)]),
	\fltr1, 3000,
	\voldecay, Pseq([Pn(0.1,16),Pn(Pwhite(0.05,0.03),16)],inf),
	\pan, 0,
	\trem, 200;
),

Pbind(\instrument,\wobble, //bass
	\dur, Pseq([Pn(Rest(800),1),Pseq([Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1),Rest(1)], 40)]),
	\cfreq1, 200,
	\cfreq2, 200,
	\voldecay, 0.2,
	\vol1, 0.2,
	\pan, Pwhite(-1,1,inf),
	\pfreqdecay, Pwhite(0.1,0.4,inf);
),

Pbind(\instrument,\kick, //low bell
	\vol1, 0.2,
	\voldecay, Pseq([Rest(928),Pseq([Pn(Pseq([0.2,Rest(1),Rest(1),0.2,Rest(1),Rest(1),0.2,Rest(1),0.4,Rest(1),Rest(1),Rest(1),0.3,Rest(1),Rest(1),Rest(1)]),3),Pseq([0.2,Rest(1),Rest(1),0.2,Rest(1),Rest(1),0.2,Rest(1),0.4,Rest(1),Rest(1),Rest(1),0.3,Rest(1),Rest(1),Rest(1)])],32)]),
	\freq1, 1000,
	\freq2, Pseq([Rest(928),Pseq([Pn(Pseq([250,Rest(1),Rest(1),330,Rest(1),Rest(1),330,Rest(1),400,Rest(1),Rest(1),Rest(1),250,Rest(1),Rest(1),Rest(1)]),3),Pseq([250,Rest(1),Rest(1),440,Rest(1),Rest(1),440,Rest(1),400,Rest(1),Rest(1),Rest(1),380,Rest(1),Rest(1),Rest(1)])],32)]),
	\dur, Pseq([Rest(928),Pseq([1,Rest(1),Rest(1),1,Rest(1),Rest(1),1,Rest(1),1,Rest(1),Rest(1),Rest(1),1,Rest(1),Rest(1),Rest(1)],32)]);
),

Pbind(\instrument,\kick, //high bell
	\vol1, 0.2,
	\voldecay, 0.1,
	\freq1, 1000,
	\freq2, Pseq([Rest(1056),Pseq([Pn(Pseq([Rest(1),500,800,660,Rest(1),Rest(1),Rest(1),500,800,660,Rest(1),Rest(1),Rest(1),500,800,Rest(1)]),3),Pseq([Rest(1),1000,880,800,Rest(1),Rest(1),Rest(1),880,660,800,Rest(1),Rest(1),Rest(1),760,Rest(1),Rest(1)])],16)]),
	\pan, 0.7,
	\dur, Pseq([Rest(1056),Pseq([Rest(1),1,1,1,Rest(1),Rest(1),Rest(1),1,1,1,Rest(1),Rest(1),Rest(1),1,1,Rest(1)],16)]);
),

Pbind(\instrument,\kick, //higher bell
	\vol1, 0.05,
	\voldecay, 0.7,
	\freq1, 1000,
	\freq2, Pseq([Rest(1088),Pseq([Pn(Pseq([Rest(1),1000,1680,1740,Rest(1),Rest(1),Rest(1),1000,1680,1740,Rest(1),Rest(1),Rest(1),1000,1650,Rest(1)]),3),Pseq([Rest(1),2000,1760,1600,Rest(1),Rest(1),Rest(1),2060,1760,1600,Rest(1),Rest(1),Rest(1),1520,Rest(1),Rest(1)],1)],24)]),
	\pan, -0.7,
	\dur, Pseq([Rest(1088),Pseq([Rest(1),1,1,1,Rest(1),Rest(1),Rest(1),1,1,1,Rest(1),Rest(1),Rest(1),1,1,Rest(1)],24)]);
),

Pbind(\instrument,\ring, //high 2nd entrance
	\mfreqdecay, 0.5,
	\mfreq1, Pseq([1500,1700,2700,2400,500],inf),
	\mfreq2, Pseq([600,900,400,1000,600],inf),
	\cfreqdecay, Pxrand([Pn(0.5,8),Pn(1,8),Pn(1.5,8)],inf),
	\cfreq1, 600,
	\cfreq2, 100,
	\trem, 1,
	\vol1, 0.3,
	\voldecay, Pwhite(0.1,0.2,inf),
	\dur, Pseq([Rest(992),Pseq([1,Rest(1),1,Rest(1),0.5,Rest(0.5),0.5,Rest(0.5)],48)]);
)]).play(t);
)