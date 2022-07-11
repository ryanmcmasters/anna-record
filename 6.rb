use_bpm 72

live_loop :noise do
  [3,4].choose.times do
    use_synth [:bnoise, :pnoise, :noise].choose
    play 60, attack: 0, sustain: 0.0625, release: 0, pan: rrand(-1,-0.5), amp: 1
    use_synth :dtri
    play 90+[0.25,0.5,-0.5,0.5].choose, attack: 0, sustain: 0.0625, release: 0, pan: -1
    sleep 0.125
  end
  sleep 0.125
end

live_loop :noise2 do
  [3,4].choose.times do
    use_synth [:bnoise, :pnoise, :noise].choose
    play 60, attack: 0, sustain: 0.0625, release: 0, pan: rrand(0.5,1), amp: 1
    use_synth :dtri
    play 90+[0.25,0.5,-0.5,0.5].choose, attack: 0, sustain: 0.0625, release: 0, pan: 1
    sleep 0.125
  end
  sleep 0.125
end

live_loop :center do
  use_synth :dtri
  play 98, attack: 0, sustain: 0.125, release: 0
  sleep 2
end

live_loop :bass do
  use_synth :dtri
  play 38, attack: 0, sustain: 0.125, release: 0, amp: 2
  sleep [0.5, 0.25, 0.125].choose
end








