
/* SynthDefs (Synth Definitions)

The {}.play notation is not the preferred one for SC3, but it allowed us to get started with synthesis quickly. What you will often see from now on is a use of the SynthDef construct to define networks of unit generators instead. Lots of synths can then be created from a single SynthDef recipe, and these definitions can be saved in memory or on your disk and played simply by using their name as an argument to Synth(\name).  The SynthDef is given a unique name as its first argument, and the synthesis function, like the ones we have been writing, as its second argument.  The only difference is that we MUST also specify an audio Bus for its signal output,  using Out.ar usually as the last statement within that function. The full explanation of the Out UGen is deferred until we discuss busses, but you can think of it for now as saying 'play on the designated audio output of the computer'.
*/

SynthDef(\sine, {
	Out.ar(0,
		SinOsc.ar(Rand(440,880) // Rand chooses a random number when the Synth starts, but it cannot change while it runs -- see SynthDef helpfile discussion of 'Static versus Dynamic elements
			,0,0.1))
}).add;

/* The 'add' method puts the synth definition in a directory in memory where it will be automatically loaded by all Servers when they are booted. It means that you can compile this definition before the Server boots, and you don't need to redefine it during a session.  The alternative method  'store' writes this definition permanently to your disk in the "/Users/chris/Library/Application Support/Supercollider/synthdefs/" directory.  If you look there you'll see the files that each represent individual SynthDefs that are automatically loaded up when you boot the synthesis server.  Once a SynthDef is loaded on the Server, you can create an individual synthesizer to that specification:
*/

Synth(\sine);

// In fact, it can be used as many times over as you desire (run these lines one at a time):
(
a=Synth(\sine);  // assign the synth to an environment variable
b=Synth(\sine);
c=Synth(\sine);
)
// And run these lines one at a time to individually stop each synth:

a.free;  // use the variables to stop each running synth
b.free;
c.free;

//The 'play' method of SynthDef loads the definition to the server and plays it in a single step:

SynthDef(\saw, {Out.ar(0,Saw.ar(Rand(440,880),0.1))}).play(s);

// The 'send' method is like 'add' but only sends the defintion to a named server that is already running

SynthDef("aaa",{Out.ar(0,SinOsc.ar(440,0,0.1))}).send(s);

Synth("aaa"); //now that the server has it, you can play it

SynthDef(\sine,{ arg freq=440, amp=0.1; Out.ar(0,SinOsc.ar(freq,0,amp))}).add; // this revises our previous definition with arguments for frequency and amplitude to the synthesis function. Note that the name of the SynthDef can either be specified as a symbol \sine and a string "sine"- you'll see both ways in examples.

Synth("sine"); // this uses the default arguments given in the above definition

Synth("sine",[\freq,880]); //this replaces the default value, showing how to start lots of related Synths from a common SynthDef with slight variations.

a=Synth(\sine);
b=Synth(\sine,[\freq,550]);
c=Synth(\sine,[\freq,660, \amp, 0.25]);

// You can also send new values to arguments of the running Synths using the method 'set':

a.set(\freq,1500);
b.set(\freq,1200);
c.set(\amp,0.1);

// now stop each synth:

a.free;
b.free;
c.free;


