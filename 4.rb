fund = 40

live_loop :sines do
  use_synth :sine
  play (hz_to_midi fund), sustain: 10, attack: rrand(1,3), pan: rrand(-1,1), release: rrand(1,5)
  sleep rrand(2,10)
end

live_loop :sines2 do
  use_synth :sine
  play (hz_to_midi fund*2.25), sustain: 10, attack: rrand(1,3), pan: rrand(-1,1), release: rrand(1,5)
  sleep rrand(2,10)
end

live_loop :sines3 do
  use_synth :sine
  play (hz_to_midi fund*1.5), sustain: 10, attack: rrand(1,3), pan: rrand(-1,1), release: rrand(1,5)
  sleep rrand(2,10)
end

live_loop :sines4 do
  use_synth :sine
  play (hz_to_midi fund*1.75), sustain: 10, attack: rrand(1,3), pan: rrand(-1,1), release: rrand(1,5)
  sleep rrand(2,10)
end

live_loop :shift do
  use_synth :sine
  play (hz_to_midi fund*[16,8,32,4].choose), attack: 5, sustain: 70, release: 5, pan: rrand(-0.25,0.25), amp: 0.75
  sleep 15
end

live_loop :fund do
  fund = [40,48].choose
  sleep 5
end


