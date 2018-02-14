//Sampling SynthDefs

(
Buffer.read(s,Platform.resourceDir +/+ "sounds/a11wlk01.wav");

SynthDef(\micsample,{arg in=0,pan=0,gate=1,vol1=1,vol2=0,voldecay=1,trem=0,amp=1;
	var env,tremolo,input;
	env=Env.new([0,vol1,vol2],[0,voldecay]);
	tremolo=SinOsc.kr(trem);
	input=amp*Pan2.ar(SoundIn.ar(in,EnvGen.ar(env,gate,doneAction:2)),pan+tremolo);
	Out.ar(0,input);
}).store;

SynthDef(\simpleSampler,{arg out=0,amp=1,buf,rate=2,vol1=1,vol2=0,voldecay=0.2,gate=1,trigger=1,startPos=0,trem=0,loop=1,pan=0;
	var input,env,output;
	env=Env.new([0,vol1,vol2],[0,voldecay]);
    input=Pan2.ar(PlayBuf.ar(1,buf,BufRateScale.kr(buf)*rate,trigger,BufFrames.ir(buf)*startPos,loop),pan,EnvGen.kr(env,gate,doneAction:2));
	Out.ar(out,input)
}).store;

SynthDef(\ringSampler,{arg out=0, amp=1,gate=1,pan=0,trem=0,vol1=1,vol2=0,voldecay=1,freq1=440,freq2=100,freqdecay=1,buf;
	var input,env,env1,tremolo;
	env=Env.new([0,vol1,vol2],[0,voldecay]);
	env1=Env.new([0,freq1,freq2],[0,freqdecay],'exp');
	tremolo=SinOsc.kr(trem);
	input=amp*Pan2.ar(BufRd.ar(1,buf,K2A.ar(BufFrames.ir(buf)*EnvGen.kr(env,gate,doneAction:2)).lag(SinOsc.kr(EnvGen.kr(env1,gate)))),pan+tremolo);
	Out.ar(out,input)
}).store;
)


(
var a,tempo,out;
tempo=TempoClock(150*4/60);
a=Ppar([
Pbind(\instrument,\kick,
	\vol1, 0.7,
	\dur, Pseq([1,Rest(3)],inf)),

Pbind(\instrument,\micsample, //blow directly into your laptop mic for this one!
	\dur, Pseq([1,Rest(1)],inf),
	\trem, 200,
	\vol1, Pwhite(0,1),
	\voldecay, 0.4),

Pbind(\instrument, \simpleSampler,
	\vol1, 0.3,
	\voldecay, Pwhite(0.05,0.1),
	\startPos, Pwhite(0.1,0.9),
	\pan, Pseq([Pn([-0.5,Rest(1)],8),Pn([0.5,Rest(1)],8)],inf),
	\rate, Pseq([3,Rest(1),2,Rest(1),5,Rest(1),4,Rest(1)],inf),
	\dur, 1),

Pbind(\instrument,\ringSampler,
	\voldecay, 3,
	\trem, Pseq([Pwhite(1,400),Rest(31)],inf),
	\freq1, 100,
	\freq2, Pwhite(2500,17000),
	\freqdecay, 0.2,
	\vol1, 0.7,
	\vol2, 0,
	\dur, Pseq([1,Rest(31)],inf))]);

out=Pseq([a],inf);
out.play(tempo);
)


//Note: When I've attempted to load samples from my own desktop, it seems to be unable to locate the file, and even say "false" when it check it's existence with File.exists. The example file seems to work, though...? The below file didn't load.

"C:/Users/amina/Desktop/Test.aiff"
File.exists(Platform.resourceDir +/+"C:/Users/amina/Desktop/Test.aiff");