use_bpm 55

live_loop :clock do
  sleep 1
end


live_loop :seq, sync: :clock do
  s = rrand(0,0.875)
  f = s + 0.0625
  sample :guit_em9, rate: [1,1.125].choose*[32,16,8,4,2,1,0.5].choose,
    amp: 1, start: s, finish: f, pan: rrand(-0.5,0)
  sleep [0.25,0.125].choose
end

live_loop :seq2, sync: :clock do
  s = rrand(0,0.875)
  f = s + 0.0625
  sample :guit_em9, rate: [1,1.125].choose*[32,16,8,4,2,1,0.5].choose,
    amp: 1, start: s, finish: f, pan: rrand(0,0.5)
  sleep [0.25,0.125].choose
end

live_loop :seq3, sync: :clock do
  s = rrand(0,0.875)
  f = s + 0.0625
  r = [1,1.125].choose
  rrand_i(4,16).times do
    sample :guit_em9, rate: r,
      amp: 0.5, start: s, finish: f
    sleep [0.125].choose
  end
end

live_loop :drums, sync: :clock do
  sample [:bd_boom, :elec_tick].choose, amp: [0,3].choose
  use_synth :sine
  
  2.times do
    play [88,90].choose, attack: 0, sustain: 0.05, release: 0, pan: rrand(-1,1), amp: 0.25
  end
  
  sleep 0.125
end


