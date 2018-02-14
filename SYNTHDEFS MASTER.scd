//SYNTHDEFS TO LOAD

//NOTE: I left the amp argument out of my older SynthDefs because when I put it in, it seemed to lower the volume of the synth significantly- even when the value set for amp was the same as the prior value I used in lieu of the amp argument. I don't quite understand why! I also added two ring modulating synths and two sampling synth at the bottom of this list.

(
ControlSpec.specs[\freq1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\freq2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\vol1]=[0,1,\lin].asSpec;
ControlSpec.specs[\vol2]=[0,1,\lin].asSpec;
ControlSpec.specs[\fltr1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\fltr2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\pitchdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\voldecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\fltrdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\q]=[0.001,5,\lin].asSpec;
ControlSpec.specs[\pan]=[-1,1,\lin].asSpec;
ControlSpec.specs[\trem]=[0,1000,\lin].asSpec;
ControlSpec.specs[\mfreq1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\mfreq2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\mfreqdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\cfreq1]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\cfreq2]=[0.01,20000,\exp].asSpec;
ControlSpec.specs[\cfreqdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\tfreq1]=[0,20000,\exp].asSpec;
ControlSpec.specs[\tfreq2]=[0,20000,\exp].asSpec;
ControlSpec.specs[\tfreqdecay]=[0,10,\exp].asSpec;
ControlSpec.specs[\pfreq1]=[0,20000,\exp].asSpec;
ControlSpec.specs[\pfreq2]=[0,20000,\exp].asSpec;
ControlSpec.specs[\pfreqdecay]=[0.001,10,\exp].asSpec;
ControlSpec.specs[\lfo]=[0,20000,\exp].asSpec;

Buffer.read(s,Platform.resourceDir +/+ "sounds/a11wlk01.wav");

//Kick
(
	SynthDef(\kick,{arg freq1=12000, freq2=50, vol1=1, vol2=0, pitchdecay=0.001, voldecay=0.8, pan=0, gate=1;

	var env1, env2, input;
	env1=Env.new([0,freq1,freq2],[0,pitchdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	input=Pan2.ar(0.6*SinOsc.ar(EnvGen.kr(env1,gate))*EnvGen.kr(env2,gate,doneAction:2),pan);
	Out.ar(0,input)
}).store;
);


//Pads/Bass
(
	SynthDef(\bassline,{arg freq1=400,freq2=400,vol1=1,vol2=0,fltr1=10,fltr2=1000,fltrdecay=2,pitchdecay=2,q=3,voldecay=1,trem=0,lfo=0,gate=1,pan=0;

	var env1,env2,env3,panvar,lfovar,input;
	env1=Env.new([0,freq1,freq2],[0,pitchdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	env3=Env.new([0,fltr1,fltr2],[0,fltrdecay]);
	lfovar=SinOsc.kr(lfo);
	panvar=pan + SinOsc.kr(trem);
	input=BPF.ar(Pan2.ar(0.9*SinOsc.ar(EnvGen.kr(env1,gate)+lfovar)*EnvGen.kr(env2,gate, doneAction:2) + 0.9*Pulse.ar(EnvGen.kr(env1,gate)+lfovar)*EnvGen.kr(env2,gate, doneAction:2) + 0.9*Saw.ar(EnvGen.kr(env1,gate)+lfovar)*EnvGen.kr(env2,gate, doneAction:2),panvar),EnvGen.kr(env3,gate),q);
		Out.ar(0,input)
}).store;
);


//SimpleSaw
(
	SynthDef(\simpleSaw,{arg freq1=400,freq2=400,vol1=1,vol2=0,fltr1=10,fltr2=1000,fltrdecay=2,pitchdecay=2,q=3,voldecay=1,gate=1,pan=0;

	var env1,env2,env3,input;
	env1=Env.new([0,freq1,freq2],[0,pitchdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	env3=Env.new([0,fltr1,fltr2],[0,fltrdecay]);
	input=RLPF.ar(Pan2.ar(0.5*Saw.ar(EnvGen.kr(env1,gate))*EnvGen.kr(env2,gate, doneAction:2),pan),EnvGen.kr(env3,gate),q);
		Out.ar(0,input)
}).store;
);


//SimpleSquare
(
	SynthDef(\simpleSquare,{arg freq1=400,freq2=400,vol1=1,vol2=0,fltr1=10,fltr2=1000,fltrdecay=2,pitchdecay=2,q=3,voldecay=1,gate=1,pan=0;

	var env1,env2,env3,input;
	env1=Env.new([0,freq1,freq2],[0,pitchdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	env3=Env.new([0,fltr1,fltr2],[0,fltrdecay]);
	input=RLPF.ar(Pan2.ar(0.5*Pulse.ar(EnvGen.kr(env1,gate))*EnvGen.kr(env2,gate, doneAction:2),pan),EnvGen.kr(env3,gate),q);
		Out.ar(0,input)
}).store;
);


//High Hats
(
    SynthDef(\hh,{arg fltr1=1500,fltr2=20,q=1,vol1=1,vol2=0,voldecay=0.09,fltrdecay=0.2,pan=0,trem=100,gate=1;

	var env1, env2, panvar, input;
	env2=Env.new([0,vol1,vol2], [0,voldecay]);
	env1=Env.new([fltr1,fltr2],[fltrdecay]);
	panvar=pan + SinOsc.kr(trem);
	input=
	Pan2.ar(0.9*RHPF.ar(WhiteNoise.ar(EnvGen.kr(env2,gate,doneAction:2)),EnvGen.kr(env1,gate),q),panvar) +
	Pan2.ar(0.9*RHPF.ar(BrownNoise.ar(EnvGen.kr(env2,gate,doneAction:2)),EnvGen.kr(env1,gate),q),panvar) +
	Pan2.ar(0.9*RHPF.ar(ClipNoise.ar(EnvGen.kr(env2,gate,doneAction:2)),EnvGen.kr(env1,gate),q),panvar);
		Out.ar(0,input)
}).store;
);


//Snare/Hat
(
    SynthDef(\hh2,{arg fltr1=1500,fltr2=20,q=1,vol1=1,vol2=0,voldecay=0.09,fltrdecay=0.2,pan=0,trem=100,gate=1;

	var env1, env2, panvar, input;
	env2=Env.new([0,vol1,vol2], [0,voldecay]);
	env1=Env.new([fltr1,fltr2],[fltrdecay]);
	panvar=pan + SinOsc.kr(trem);
	input=
	Pan2.ar(0.9*BPF.ar(WhiteNoise.ar(EnvGen.kr(env2,gate,doneAction:2)),EnvGen.kr(env1,gate),q),panvar);
		Out.ar(0,input)
}).store;
);


//Ring Synth
(
SynthDef(\ring,{arg gate=1, vol1=1, vol2=0, voldecay=3, mfreq1=660, mfreq2=660, mfreqdecay=3, cfreq1=880, cfreq2=440, cfreqdecay=3, trem=0, pan=0;
	var ca,mo,env1,mofenv,cafenv,panvar,input;
	mofenv=Env.new([0,mfreq1,mfreq2],[0,mfreqdecay]);
	cafenv=Env.new([0,cfreq1,cfreq2],[0,cfreqdecay]);
	env1=Env.new([0,vol1,vol2], [0,voldecay]);
	mo=SinOsc.ar(EnvGen.kr(mofenv,gate),0,EnvGen.kr(env1,gate,doneAction:2));
	ca=SinOsc.ar(EnvGen.kr(cafenv,gate),0,EnvGen.kr(env1,gate,doneAction:2));
	panvar= pan+SinOsc.kr(trem);
	input=Pan2.ar(ca*mo,panvar);
	Out.ar(0,input);
}).store;
);


//Wobble Bass
(
SynthDef(\wobble,{arg gate=1, vol1=1, vol2=0, voldecay=0.7, pfreq1=100, pfreq2=1000, pfreqdecay=1, cfreq1=100, cfreq2=100, cfreqdecay=0.002, tfreq1=0, tfreq2=0, tfreqdecay=0.9, pan=0;
	var env1, env2, env3, env4, synth, input, panvar;
	env1=Env.new([0,cfreq1,cfreq2],[0,cfreqdecay]);
	env2=Env.new([0,vol1,vol2],[0,voldecay]);
	env3=Env.new([0,pfreq1,pfreq2],[0,pfreqdecay]);
	env4=Env.new([0,tfreq1,tfreq2],[0,tfreqdecay]);
	synth=SinOsc.ar(EnvGen.ar(env1,gate),SinOsc.ar(EnvGen.kr(env3,gate)),EnvGen.ar(env2,gate,doneAction:2));
	panvar=pan+SinOsc.kr(EnvGen.ar(env4,gate));
	input=Pan2.ar(synth,panvar);
	Out.ar(0,input);
}).store;
);

//Microphone w/Envelope
(
SynthDef(\micsample,{arg in=0,pan=0,gate=1,vol1=1,vol2=0,voldecay=1,trem=0,amp=1;
	var env,tremolo,input;
	env=Env.new([0,vol1,vol2],[0,voldecay]);
	tremolo=SinOsc.kr(trem);
	input=amp*Pan2.ar(SoundIn.ar(in,EnvGen.ar(env,gate,doneAction:2)),pan+tremolo);
	Out.ar(0,input);
}).store;
);

//simpleSampler
(
SynthDef(\simpleSampler,{arg out=0,amp=1,buf,rate=2,vol1=1,vol2=0,voldecay=0.2,gate=1,trigger=1,startPos=0,trem=0,loop=1,pan=0;
	var input,env,output;
	env=Env.new([0,vol1,vol2],[0,voldecay]);
    input=Pan2.ar(PlayBuf.ar(1,buf,BufRateScale.kr(buf)*rate,trigger,BufFrames.ir(buf)*startPos,loop),pan,EnvGen.kr(env,gate,doneAction:2));
	Out.ar(out,input)
}).store;
);

//ringSampler
(
SynthDef(\ringSampler,{arg out=0, amp=1,gate=1,pan=0,trem=0,vol1=1,vol2=0,voldecay=1,freq1=440,freq2=100,freqdecay=1,buf;
	var input,env,env1,tremolo;
	env=Env.new([0,vol1,vol2],[0,voldecay]);
	env1=Env.new([0,freq1,freq2],[0,freqdecay],'exp');
	tremolo=SinOsc.kr(trem);
	input=amp*Pan2.ar(BufRd.ar(1,buf,K2A.ar(BufFrames.ir(buf)*EnvGen.kr(env,gate,doneAction:2)).lag(SinOsc.kr(EnvGen.kr(env1,gate)))),pan+tremolo);
	Out.ar(out,input)
}).store;
);
)