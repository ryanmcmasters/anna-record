use_bpm 60

live_loop :diff do
  play (hz_to_midi (300 + rrand_i(0,15))), pan: rrand(-0.5,0.5), attack: 0.5, sustain: 5, release: 0.5
  sample :elec_tick, rate: 4, pan: [-0.75,0.75].tick, amp: 5
  sleep 0.125
end

live_loop :bass do
  use_synth :tb303
  sus = [1,2,3,4,6,8].choose
  play (hz_to_midi 37.5*[1,1.2,0.75].choose), attack: 0, sustain: sus, release: 0, amp: 3
  sleep (sus + 1)
end

live_loop :kick do
  sample :bd_mehackit, amp: 10, pan: -0.1
  sample :drum_roll, amp: 2, pan: rrand(-1,1)
  sleep 1
end





