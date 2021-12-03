//: A code that makes a long complex piece.
(
{
	var note, note2,note3, sound1, sound2, sound3;
	sound1 = { SinOsc.ar(150, 0, 1).dup }.play;
	1.wait;

	0.1.wait;
	sound2 = { SinOsc.ar(400, 0, 0.1).dup }.play;
	0.5.wait;
	sound3 = { SinOsc.ar(200, 0, 0.3).dup }.play;
	0.5.wait;

	sound3.release;
	sound1.release;
	sound2.release;

	note = { | freq = 300 |
		var synth;
		synth = Synth("sine", [freq: freq]);
		0.1.wait; // wait for 1 second
		synth.release;
	};
	// run the note function 5 times.
	5 do: { | i |
		note.((60 + i).midicps);
		0.1.wait;
		};
	note2 = { | freq = 300 |
		var synth;
		synth = Synth("sine", [freq: freq]);
		0.1.wait; // wait for 1 second
		synth.release;
	};
	// run the note function 5 times.
	5 do: { | i |
		note.((60 + i).midicps);
		0.1.wait;
	};

	note3 = { | freq = 400 |
		var synth;
		synth = Synth("sine", [freq: freq]);
		0.1.wait; // wait for 1 second
		synth.release;
	};
	// run the note function 5 times.
	7 do: { | i |
		note.((90 + i).midicps);
		0.1.wait;
	};

	sound1 = { SinOsc.ar(600, 0, 0.1).dup }.play;
	0.5.wait;

	0.1.wait;
	sound2 = { SinOsc.ar(400, 0, 0.1).dup }.play;
	0.5.wait;
	sound3 = { SinOsc.ar(600, 0, 0.3).dup }.play;
	0.5.wait;

	sound3.release;
	sound1.release;
	sound2.release;
	sound2 = { SinOsc.ar(800, 0, 0.1).dup }.play;
	0.5.wait;
	sound2.release;
	sound1 = { SinOsc.ar(900, 0, 0.1).dup }.play;
	0.5.wait;

	0.1.wait;
	sound2 = { SinOsc.ar(800, 0, 0.1).dup }.play;
	0.5.wait;
	sound3 = { SinOsc.ar(900, 0, 0.1).dup }.play;
	0.5.wait;
	sound3.release;
	sound1.release;
	sound2.release;
}.fork
)
//:
// package this code in a function to play the same
// melody as many times as you like.
//:
f = { | freqscale = 1, miditranspose = 0, tempo |
	tempo ?? {
		tempo = TempoClock.default;
	};
{
	var note, note2,note3, sound1, sound2, sound3;
	sound1 = { SinOsc.ar(150 * freqscale, 0, 1).dup }.play;
	1.wait;

	0.1.wait;
	sound2 = { SinOsc.ar(400 * freqscale, 0, 0.1).dup }.play;
	0.5.wait;
	sound3 = { SinOsc.ar(200 * freqscale, 0, 0.3).dup }.play;
	0.5.wait;

	sound3.release;
	sound1.release;
	sound2.release;

	note = { | freq = 300 |
		var synth;
		synth = Synth("sine", [freq: freq]);
		0.1.wait; // wait for 1 second
		synth.release;
	};
	// run the note function 5 times.
	5 do: { | i |
		note.((60 + i + miditranspose).midicps);
		0.1.wait;
	};
	note2 = { | freq = 300 |
		var synth;
		synth = Synth("sine", [freq: freq * freqscale]);
		0.1.wait; // wait for 1 second
		synth.release;
	};
	// run the note function 5 times.
	5 do: { | i |
		note.((60 + i + miditranspose).midicps);
		0.1.wait;
	};

	note3 = { | freq = 400 |
		var synth;
		synth = Synth("sine", [freq: freq * freqscale]);
		0.1.wait; // wait for 1 second
		synth.release;
	};
	// run the note function 5 times.
	7 do: { | i |
		note.((90 + i + miditranspose).midicps);
		0.1.wait;
	};

	sound1 = { SinOsc.ar(600 * freqscale, 0, 0.1).dup }.play;
	0.5.wait;

	0.1.wait;
	sound2 = { SinOsc.ar(400 * freqscale, 0, 0.1).dup }.play;
	0.5.wait;
	sound3 = { SinOsc.ar(600 * freqscale, 0, 0.3).dup }.play;
	0.5.wait;

	sound3.release;
	sound1.release;
	sound2.release;
	sound2 = { SinOsc.ar(800 * freqscale, 0, 0.1).dup }.play;
	0.5.wait;
	sound2.release;
	sound1 = { SinOsc.ar(900 * freqscale, 0, 0.1).dup }.play;
	0.5.wait;

	0.1.wait;
	sound2 = { SinOsc.ar(800 * freqscale, 0, 0.1).dup }.play;
	0.5.wait;
	sound3 = { SinOsc.ar(900 * freqscale, 0, 0.1).dup }.play;
	0.5.wait;
	sound3.release;
	sound1.release;
	sound2.release;
}.fork(tempo)
};
//:test this function (vending machine)
f.value;
// package this code in a function to play the same
// melody as many times as you like.
f.(0.5, 17);
//:
f.(0.5, 17, TempoClock(2));
//:
f.(0.5, 17, TempoClock(3));
//:
{
	f.(0.5, 17);
	5.wait;
	f.(0.5, 17, TempoClock(2));
	3.wait;
	f.(0.5, 17, TempoClock(3));
}.fork;

//:
{
	5 do: {
	f.(0.5 rrand: 1.5, 17 rrand: 40);
	5.wait;
	f.(0.5 rrand: 1.5, 17 rrand: 40, TempoClock(2 rrand: 4.0));
	3.wait;
	f.(0.5 rrand: 1.5, 17 rrand: 50, TempoClock(3 rrand: 4.0));
	}
}.fork;
