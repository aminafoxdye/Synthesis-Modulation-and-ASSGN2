(
SynthDef(\bass,{
	arg dur = 5, amp = 0.5, pan = 0;
	var bass, env, sig;
	sig = SinOsc.ar([40,60]);
	env = EnvGen.kr(Env.perc(0.02, 4, 0.8, \sine), doneAction: 2);
	bass = sig * env;
	Out.ar(0, bass);
}).add;

SynthDef(\waves,{
	arg freq = 60, pan = 0, amp = 0.1, dur = 5;
	var sig, env, wave;
	sig = BrownNoise.ar;
	env = EnvGen.kr(Env.adsr(1, 3, 0.1, 1, 0.2, [2, -3]), doneAction: 2);
	wave = sig * env;
	Out.ar([-1,1], wave);
}).add;

SynthDef(\monky,{
	arg freq=60,ffrq=600,rq=0.3,spd=5,dur=0.2,amp=0.2,att=0.1,rls=0.25,gate=1,pan=0,rng=0.01;
	var sig, modOsc, env;
	env = EnvGen.kr(Env.asr(att,1,rls),gate,doneAction:2);
	modOsc = SinOsc.kr(spd,0,rng,1);
	sig = RLPF.ar(LFSaw.ar(freq*modOsc, amp), ffrq, rq, amp);
	Out.ar(0,Pan2.ar(sig*env,pan))
}).add;

SynthDef(\moomod,{
	arg freq=100, ffrq=300, spd=6.19, rng=0.01, rq=0.3, amp=1, pan=0, dur=1, att=0.1, rls=0.25, gate=1;
	var sig, modOsc, env, carrier;
    env = EnvGen.kr(Env.asr(att,1,rls), gate, doneAction:2);
	modOsc = SinOsc.kr(spd,0,rng,1);
	carrier = SinOsc.ar(freq*LFTri.kr(spd/12));
    sig = RLPF.ar(SinOsc.ar(freq*modOsc, amp), ffrq, rq, amp) * carrier;
	Out.ar(0, Pan2.ar(sig * env, pan))
}).add;

SynthDef(\caws, {
	arg freq = 800, dur = 0.2, amp = 0.5;
	var sig, env, caw;
	sig = Saw.ar(freq)+Saw.ar(freq*0.5)+Saw.ar(freq*0.8);
	env = EnvGen.kr(Env.perc(0.01, 0.21, 0.8), doneAction: 2);
	caw = (sig * SinOsc.ar(freq*3)) * env;
	Out.ar(0, caw)
}).add;

SynthDef(\fluty, {
	arg freq = 440, dur = 4.2, amp = 0.5, pan = 0;
	var sig, pmod, fmod, env;
	env = EnvGen.kr(Env.new([0, 0.5, 0], [0.1, 4], \sine, 0, 0, 0), doneAction: 2);
	fmod = SinOsc.ar(2);
	pmod = SinOsc.ar(700);
	sig = (SinOsc.ar(fmod, pmod)) * env;
	Out.ar([-1, 1], sig)
}).add;

SynthDef(\boing, {
	arg freq = 350, dur = 1, amp = 0.5, pan = 0;
	var sig, env;
	env = EnvGen.kr(Env.perc(0.03, 0.77), doneAction: 2);
	sig = RLPF.ar(Saw.ar(freq), 400, 1) * env;
	sig = BPF.ar(sig, FSinOsc.kr(XLine.kr(0.7,300,10),0,3600,4000), 0.3);
	Out.ar([-1,1], sig)
}).add;

SynthDef(\gravel, {
	arg freq = 20, dur = 0.01, amp = 0.2, pan = 0;
	var sig, env;
	env = EnvGen.kr(Env.perc(0.005, 0.01, 0.2), doneAction: 2);
	sig = (BrownNoise.ar + SinOsc.ar(60)) * env;
	Out.ar([-1,1], sig)
}).add;
)
-----
(
Pdef(\a,
	Pbind(
		\instrument, \bass,
		\dur, 5,
		\amp, 0.5
));

Pdef(\b,
	Pbind(
		\instrument, \waves,
		\dur, 5,
		\amp, 0.1,
));

~filterfreak=[400, 450, 500, 180, 300, 250, 200];
Pdef(\c,
	Pbind(
		\instrument,\monky,
    	\ffrq,Pseq(~filterfreak++~filterfreak.reverse,inf),
		\freq, 60,
		\rq,0.2,
		\att, 0.1,
		\dur,Pseq([0.1,0.05,0.13,0.08,0.15],inf),
		\legato, 0.9,
		\amp,0.2
));

~freqRise=[300,600,900,1200,1500,1800,2100,2400];
Pdef(\d,
	Pbind(
		\instrument,\moomod,
		\ffrq,Pstutter(6,Pseq(~freqRise++~freqRise.reverse,inf)),
		\degree,Pseq([0,12,5,8],inf),
		\octave,3,
		\scale,Scale.hijaz,
		\att,0.01,
		\rls,0.3,
		\dur,0.4,
		\amp, Pseq([0.2, 0.3, 0.4, 0.5], inf)
));

~ampseq = [0.4, 0.3, 0.2, 0.2, 0.1, 0.1, 0.07, 0.05];
~noteseq = [800, 700, 700, 700, 700, 500, 500, 500];
Pdef(\e,
	Pbind(
		\instrument, \caws,
		\amp, Pseq(~ampseq, inf),
		\freq, Pseq(~noteseq, inf),
		\dur, 0.8
));

~melody = [880, 600, 700, 440, 650, 500, 550];
Pdef(\f,
	Pbind(
		\instrument, \fluty,
		\dur, 4.2,
		\amp, 0.1,
		\freq, 880,
));

Pdef(\g,
	Pbind(
		\instrument, \boing,
		\dur, 1,
		\amp, 0.2,
		\freq, 350,
));

Pdef(\h,
	Pbind(
		\instrument, \gravel,
		\delta, Prand([0.1, 0.2, 0, 0, 0.1, 0.3, 0.1, 0.2], inf),
		\amp, 0.1,
		\freq, 60,

));
)

---

Pdef.clear

---
Pdef(\a).play;  //boom
Pdef(\a).stop;

Pdef(\b).play;  //waves
Pdef(\b).stop;

Pdef(\c).play;  //monky
Pdef(\c).stop;

Pdef(\d).play;  //moomod
Pdef(\d).stop;

Pdef(\e).play;  // caws
Pdef(\e).stop;

Pdef(\f).play;  //fluty
Pdef(\f).stop;

Pdef(\g).play;  //boing
Pdef(\g).stop;

Pdef(\h).play;  //gravel
Pdef(\h).stop;

// in order of trigger: e, a, g, f, h, d, -f, -e, b, -g, -d, -a, -b, c, -c -h

s.record;

//how do I time rests? how do I make waves fade @ end?