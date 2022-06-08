use_debug false
use_bpm 72

live_loop :clock do
  16.times do
    sleep 0.25
  end
end

fund = 100
live_loop :drums, sync: :clock do
  d = [1,2,1,1,2,1,2,2]
  8.times do |it|
    sample :bd_ada, amp: 4, rate: 0.5 if d[it]==1
    sample :elec_tick, rate: 2, amp: 3 if d[it]==2
    sleep 0.25
  end
end

live_loop :hats, sync: :clock do
  i = rrand_i(5,15)
  16.times do
    if spread(i, 16).tick
      use_synth :piano
      play (hz_to_midi fund*64), attack: 0, release: 0, sustain: rrand(0.1,0.05), pan: -0.5
      play (hz_to_midi fund*64), attack: 0, release: 0, sustain: rrand(0.1,0.05), pan: 0.5
    end
    sleep 0.125
  end
  
end


live_loop :bloop, sync: :clock do
  if spread(5,16).tick then
    play (hz_to_midi 1*fund*[1,2,4,8].choose), pan: rrand(-1,1), attack: 0.5, sustain: 0.5, release: 0
  end
  sleep 0.25
end

live_loop :bleep, sync: :clock do
  if spread(3,16).tick then
    play (hz_to_midi 2.25*fund*[1,2,4,8].choose), pan: rrand(-1,1), attack: 0.5, sustain: 0.5, release: 0
  end
  sleep 0.25
end

live_loop :blip, sync: :clock do
  if spread(4,16).tick then
    play (hz_to_midi 1.5*fund*[1,2,4,8].choose), pan: rrand(-1,1), attack: 0.5, sustain: 0.5, release: 0
  end
  sleep 0.25
end

live_loop :blat, sync: :clock do
  if spread(7,16).tick then
    play (hz_to_midi 1.75*fund*[1,2,4,8].choose), pan: rrand(-1,1), attack: 0.5, sustain: 0.5, release: 0
  end
  sleep 0.25
end

live_loop :fund, sync: :clock do
  fund = [100,125,150,175].choose
  sleep 32
end
