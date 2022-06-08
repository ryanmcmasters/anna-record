




use_debug false
use_bpm 132

shift = 0
low = 2
dur = 1

live_loop :clock do
  18.times do
    sleep 0.25
  end
end


live_loop :drums, sync: :clock do
  
  d = [1,0,0,1,2,0,0,1,0]
  
  9.times do |it|
    sample :bd_808, amp: 4, rate: 0.5 if d[it]==1
    sample :elec_tick, rate: 2, amp: 3 if d[it]==2
    sleep 0.5
  end
end

live_loop :hats, sync: :clock do
  if spread(5,9).tick then
    sample :elec_blip, pan: rrand(-1,0), rate: 1.5*[1,2,4].choose
  end
  sleep dur
end

live_loop :hats2, sync: :clock do
  if spread(3,9).tick then
    sample :elec_blip, pan: rrand(0,1), rate: 1.75*[1,2,4].choose
  end
  sleep dur
end

live_loop :hats3, sync: :clock do
  if spread(7,9).tick then
    sample :elec_blip, rate: [1,2,4].choose
  end
  sleep dur
end

live_loop :bass, sync: :clock do
  if spread(low,9).tick then
    use_synth :sine
    play 40 + shift, attack: 0.25, sustain: 0.5, release: 0.25
  end
  sleep 0.5
end

live_loop :shift, sync: :clock do
  shift = [0, 1, 3, -5].choose
  low = rrand_i(3,6)
  dur = [0.5,0.25].choose
  sleep 18
end