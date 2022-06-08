live_loop :clock do
  sleep 1
end


live_loop :samps, sync: :clock do
  
  seq = [1,2,1,1,2,1,3,1,2]
  seq.size.times do |it|
    
    sample :ambi_glass_hum, rate: [0.25,0.5,0.75].choose, amp: 2 if seq[it]==1
    
    with_fx :slicer, mix: 0.75, phase: [0.25,0.125,0.2].choose do
      sample :ambi_glass_rub, rate: [0.25,0.5,0.5625,0.75,0.875].choose,
        attack: 0.5,
        pan: rrand(-0.25,0.25) if seq[it]==2
    end
    
    with_fx :lpf, cutoff: 90 do
      with_fx :ping_pong, phase: 0.2 do
        sample :ambi_lunar_land, attack: 1, rate: [0.25,0.5,0.75].choose if seq[it]==3
      end
    end
    
    sleep 1
    
  end
  
end

live_loop :drums, sync: :clock do
  
  seq2 = [1,0,0,1,0,0,0,2,2]
  
  seq2.size.times do |it|
    sample :bd_klub if seq2[it]==1
    sample :elec_tick, rate: 2 if seq2[it]==2
    sample :vinyl_hiss, start: 0.5, sustain: 1, attack: 0.2, release: 0 if seq2[it]==0
    sleep 1.0/9
    
  end
  
end

