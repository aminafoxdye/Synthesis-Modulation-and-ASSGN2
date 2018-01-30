

Modulation Synthesis

// In modulation synthesis one wave, the carrier, is controlled (modulated) by a second, the modulator. Various techniques depend on what parameters of the carrier and modulator are connected.  Modulation synthesis provides computationally efficient shortcuts to synthesizing complex dynamic spectra. This tutorial also introduces simple GUIs to provide controls for synthesis parameters.  First boot the server then create a FreqScope that shows a spectral representation of a sound:

Server.default.boot;

// create a new analyzer window
FreqScope.new(400, 200, 0);

/*
Ring modulation is simply the multiplication of two signals, carrier * modulator.
For simple sine waves, the spectrum ends up with two frequencies (two sidebands), at C+M and C-M, where C is the carrier frequency and M is the modulator frequency. For more complex waves than sines, we get sideband products for each harmonic in the  spectrum of both the carrier and modulator.  But if C and M are harmonic, the sidebands are also harmonic. This follows from the mathematical relation

cos(C)*cos(M) = 0.5*(cos(C-M) + cos(C+M))
*/

( // Ring Modulation
{
var carrier, modulator, carfreq, modfreq;
	carfreq= MouseX.kr(440,5000,'exponential').poll(4,"cfrq");
modfreq= MouseY.kr(1,5000,'exponential').poll(4,"mfrq");
carrier= SinOsc.ar(carfreq,0,0.5);
modulator= SinOsc.ar(modfreq,0,0.5);
carrier*modulator;
}.play
)

/*
Amplitude Modulation (AM)

Using amplitude envelopes, or having a tremolo, are forms of AM.
AM is like ring modulation but with a subtle difference: the modulator is unipolar, that is, always positive.
*/

{SinOsc.ar(440,0,0.5)}.play // ring modulator:  bipolar, -0.5 to 0.5

{SinOsc.ar(440,0,0.5,0.5)}.play // amp modulator: unipolar, 0 to 1 (0.5 plus or minus 0.5)

/*  The spectrum of amplitude modulation includes the sum and difference frequencies we saw in ring modulation, at C+M and C-M, but also the original carrier frequency C.

The math is now:

cos(C)*(1+cos(M)) = cos(C)+ 0.5*(cos(C-M) + cos(C+M))
*/
(
{
var carrier, modulator, carfreq, modfreq;

carfreq= MouseX.kr(440,5000,'exponential');
modfreq= MouseY.kr(1,5000,'exponential');

carrier= SinOsc.ar(carfreq,0,0.5);
modulator= SinOsc.ar(modfreq,0,0.25, 0.25);

	carrier*modulator;   // the alternative below, with modulator controlling 'mul' arg is the same as this line

//	SinOsc.ar(carfreq,0,0.5*modulator)

}.play
)

/*
Frequency Modulation (FM)

FM was applied to digital sound synthesis by John Chowning in 1967, though he published his results in 1973. Yamaha licensed the patents and in 1983 released the Yamaha DX7 synthesiser, which went on to sell 300,000 units, the most commercially successful synthesiser of all time.

You might know the 'slow version' of FM already: a vibrato.

Rather than multiplying by the modulator, which could also control the amplitude of the carrier, we're going to plug the modulator into the carrier frequency. There will be three parameters, the carrier frequency C, the modulation frequency M, and the modulation depth or frequency deviation D.

Because there are three variables to keep track of we will use a GUI rather than the 2-dimensional mouse.
*/

(
var w, carfreqslider, modfreqslider, moddepthslider, synth;
// define ControlSpecs that scale values of sliders to appropriate ranges
var carfreqSpec = ControlSpec(20, 5000, 'exponential', 10, 440);
var modfreqSpec = ControlSpec(1, 5000, 'exponential', 1, 1);
var moddepthSpec = ControlSpec(0.01, 5000, 'exponential', 0.01, 0.01);

synth= {arg carfreq=440, modfreq=1, moddepth=0.01;
	SinOsc.ar(carfreq + (moddepth*SinOsc.ar(modfreq)),0,0.25)
}.play;

f = FlowView.new(windowTitle: "FM example");  // a window that automatically places GUI widgets for you

carfreqslider=Slider(f,40@400).action_({arg sl; synth.set(\carfreq, carfreqSpec.map(sl.value)) });  // give each slider an action function, that sets the synth arguments to its current value

modfreqslider= Slider(f,40@400).action_({arg sl; synth.set(\modfreq, modfreqSpec.map(sl.value)) });

moddepthslider= Slider(f,40@400).action_({arg sl; synth.set(\moddepth, moddepthSpec.map(sl.value)) });

f.parent.onClose_({ synth.free })  // end the synth when window closes
)

/*
In the spectrum now, there are an infinite number of sidebands, but of varying strength. Based on the values we choose for the parameters C, M and D we can make very thick spectrums, or only a light modulation effect. The sidebands turn up at

C +- kM where k is any integer, ie. C. C+M, C-M, C+2M, C-2M, ...etc

By changing the modulation frequency and depth, you can see how the energy in the sidebands is redistributed; the actual formulas for predicting this uses Bessel functions;  see Curtis Roads' The Computer Music Tutorial, or Chowning's article in Foundations of Computer Music for a full explanation of this process.

There is a much more musically effective way to control FM, through the modulation index I, defined as:

I = D/M

The ratio of frequency deviation to modulation frequency. If I is small there is little audible FM effect. The higher I is, the stronger the energy in the sidebands.
*/

(
var w, carfreqslider, modfreqslider, modindexslider, synth;
// define ControlSpecs that scale values of sliders to appropriate ranges
var carfreqSpec = ControlSpec(20, 5000, 'exponential', 10, 440);
var modfreqSpec = ControlSpec(1, 5000, 'exponential', 1, 1);
var modindexSpec = ControlSpec(0.0, 10, 'linear', 0.01, 0.0);

synth= {arg carfreq=440, modfreq=1, modindex=0;
	SinOsc.ar(carfreq + (modindex*modfreq*SinOsc.ar(modfreq)),
		0,0.25)
}.play;

f = FlowView.new(windowTitle: "FM example");  // a window that automatically places GUI widgets for you

carfreqslider=Slider(f,40@400).action_({arg sl; synth.set(\carfreq, carfreqSpec.map(sl.value)) });

modfreqslider= Slider(f,40@400).action_({arg sl; synth.set(\modfreq, modfreqSpec.map(sl.value)) });

modindexslider= Slider(f,40@400).action_({arg sl; synth.set(\modindex, modindexSpec.map(sl.value)) });

f.parent.onClose_({ synth.free })
)


( // nested version makes the code more compact
{
var modf, ind;
//  mouseX controls modFreq and MouseY controls index of modulation
modf= MouseX.kr(1,440, 'exponential');
ind=MouseY.kr(0.0,40.0);
	// the 'add' arg of the modulator (440) sets the carrier freq!
SinOsc.ar(SinOsc.ar(modf,0,modf*ind, 440),0,0.25)
}.play
)

/*
Phase Modulation

The rate of change of phase is frequency. So phase modulation is related to frequency modulation.
*/
// modulate phase ( the modulator amplitude is 2pi, which is a single cycle of a sinewave
{ SinOsc.ar(800, SinOsc.ar(XLine.kr(20, 8000, 10), 0, 2pi), 0.25) }.play(s);

/*
[PMOsc]	//  A Ugen phase modulation oscillator

This example shows use of EZSlider, which includes labeling of the controls, ControlSpecs for each parameter, and numerical readouts of the slider values.
*/

(
var w, carfreqslider, modfreqslider, modindexslider, synth;

// below is the equivalent of the shortcut FlowView class -- it can provide more design control when you want it
w=Window("FM via mod index", Rect(100, 400, 400, 300));
w.view.decorator = FlowLayout(w.view.bounds);

synth= {arg carfreq=440, modfreq=1, modindex=0.01;
	PMOsc.ar(carfreq, modfreq,modindex,0,0.25)
}.play;

carfreqslider= EZSlider(w, 300@50, "carfreq", ControlSpec(20, 5000, 'exponential', 10, 440), {|ez|  synth.set(\carfreq, ez.value)});
w.view.decorator.nextLine;

modfreqslider= EZSlider(w, 300@50, "modfreq", ControlSpec(1, 5000, 'exponential', 1, 1), {|ez|  synth.set(\modfreq, ez.value)});
w.view.decorator.nextLine;

modindexslider= EZSlider(w, 300@50, "modindex", ControlSpec(0.0, 40, 'linear', 0.01, 0.0), {|ez|  synth.set(\modindex, ez.value)});

w.front.onClose_({ synth.free });
)

//or via mouse control with fixed carfreq-=

(
{
var modf, idx;

modf= MouseX.kr(20,8000, 'exponential');
idx=MouseY.kr(0.01,40.0,'exponential');

	SinOsc.ar(440,SinOsc.ar(modf,0,2pi),0.25)
}.play
)

// In fact, anything you could control can be modulated, that is, changed over time by some oscillator or other signal.
