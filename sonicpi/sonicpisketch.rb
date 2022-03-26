use_osc "localhost", 4560

live_loop :getbpm do
  use_real_time
  bpm = sync "/osc*/bpm"
  set :globalBpm, bpm[0]
  print(bpm)
end

live_loop :getpan do
  use_real_time
  panvar = sync "/osc*/pan"
  set :pan, panvar[0]
  print(:pan)
end

live_loop :getscore do
  use_real_time
  scorevar = sync "/osc*/score"
  set :score1, scorevar[0]
  print(:score1)
end


live_loop :getatk1 do
  use_real_time
  atk1var = sync "/osc*/atk1"
  set :atk1, atk1var[0]
  print(:atk1)
end

live_loop :getrel1 do
  use_real_time
  rel1var = sync "/osc*/rel1"
  set :rel1, rel1var[0]
  print(:rel1)
end

live_loop :getamp1 do
  use_real_time
  amp1var = sync "/osc*/amp1"
  set :amp1, amp1var[0]
  print(:amp1)
end

live_loop :geteinseins do
  use_real_time
  einseinsvar = sync "/osc*/einseins"
  set :einseins, einseinsvar[0]
  print(:einseins)
end


live_loop :getatk2 do
  use_real_time
  atk2var = sync "/osc*/atk2"
  set :atk2, atk2var[0]
  print(:atk2)
end

live_loop :getrel2 do
  use_real_time
  rel2var = sync "/osc*/rel2"
  set :rel2, rel2var[0]
  print(:rel2)
end

live_loop :getamp2 do
  use_real_time
  amp2var = sync "/osc*/amp2"
  set :amp2, amp2var[0]
  print(:amp2)
end


live_loop :getatk3 do
  use_real_time
  atk3var = sync "/osc*/atk3"
  set :atk3, atk3var[0]
  print(:atk3)
end

live_loop :getrel3 do
  use_real_time
  rel3var = sync "/osc*/rel3"
  set :rel3, rel2var[0]
  print(:rel3)
end

live_loop :getamp3 do
  use_real_time
  amp3var = sync "/osc*/amp3"
  set :amp3, amp3var[0]
  print(:amp3)
end



live_loop :_snare do
  use_real_time
  sample :drum_snare_soft
  sleep get(:globalBpm)
end

live_loop :_drum do
  use_real_time
  sample :drum_heavy_kick
  sleep get(:globalBpm)
end

live_loop :_cymbal do
  use_real_time
  sample :drum_cymbal_closed
  half = get(:globalBpm ) / 2
  sleep half
end


live_loop :einseins do
  use_real_time
  einseinsvar = sync "/osc*/einseins"
  set :einseins, einseinsvar[0]
  print(:einseins)
end
live_loop :einszwei do
  use_real_time
  einszweivar = sync "/osc*/einszwei"
  set :einszwei, einszweivar[0]
  print(:einszwei)
end
live_loop :einsdrei do
  use_real_time
  einsdreivar = sync "/osc*/einsdrei"
  set :einsdrei, einsdreivar[0]
  print(:einsdrei)
end
live_loop :einsvier do
  use_real_time
  einsviervar = sync "/osc*/einsvier"
  set :einsvier, einsviervar[0]
  print(:einsvier)
end

live_loop :zweieins do
  use_real_time
  zweieinsvar = sync "/osc*/zweieins"
  set :zweieins, zweieinsvar[0]
  print(:zweieins)
end
live_loop :zweizwei do
  use_real_time
  zweizweivar = sync "/osc*/zweizwei"
  set :zweizwei, zweizweivar[0]
  print(:zweizwei)
end
live_loop :zweidrei do
  use_real_time
  zweidreivar = sync "/osc*/zweidrei"
  set :zweidrei, zweidreivar[0]
  print(:zweidrei)
end
live_loop :zweivier do
  use_real_time
  zweiviervar = sync "/osc*/zweivier"
  set :zweivier, zweiviervar[0]
  print(:zweivier)
end

live_loop :dreieins do
  use_real_time
  dreieinsvar = sync "/osc*/dreieins"
  set :dreieins, dreieinsvar[0]
  print(:dreieins)
end
live_loop :dreizwei do
  use_real_time
  dreizweivar = sync "/osc*/dreizwei"
  set :dreizwei, dreizweivar[0]
  print(:dreizwei)
end
live_loop :dreidrei do
  use_real_time
  dreidreivar = sync "/osc*/dreidrei"
  set :dreidrei, dreidreivar[0]
  print(:dreidrei)
end
live_loop :dreivier do
  use_real_time
  dreiviervar = sync "/osc*/dreivier"
  set :dreivier, dreiviervar[0]
  print(:dreivier)
end



live_loop :play_my_synth do
  if get(:score1) == nil
    print("no score")
  end
  if get(:score1) == 1
    pause = get(:globalBpm) / 2
    use_synth :prophet
    play get(:einseins), attack: get(:atk1), release: get(:rel1), pan: get(:pan), amp: get(:amp1)
    sleep(pause)
    play get(:einszwei), attack: get(:atk1), release: get(:rel1), pan: get(:pan), amp: get(:amp1)
    sleep(pause)
    play get(:einsdrei), attack: get(:atk1), release: get(:rel1), pan: get(:pan), amp: get(:amp1)
    sleep(pause)
    play get(:einsvier), attack: get(:atk1), release: get(:rel1), pan: get(:pan), amp: get(:amp1)
    sleep(pause)
  end
  if get(:score1) == 2
    pause = get(:globalBpm) / 2
    use_synth :prophet
    play get(:zweieins), attack: get(:atk2), release: get(:rel2), pan: get(:pan), amp: get(:amp2)
    sleep(pause)
    play get(:zweizwei), attack: get(:atk2), release: get(:rel2), pan: get(:pan), amp: get(:amp2)
    sleep(pause)
    play get(:zweidrei), attack: get(:atk2), release: get(:rel2), pan: get(:pan), amp: get(:amp2)
    sleep(pause)
    play get(:zweivier), attack: get(:atk2), release: get(:rel2), pan: get(:pan), amp: get(:amp2)
    sleep(pause)
  end
  if get(:score1) == 3
    pause = get(:globalBpm) / 2
    use_synth :prophet
    play get(:dreieins), attack: get(:atk3), release: get(:rel3), pan: get(:pan), amp: get(:amp3)
    sleep(pause)
    play get(:dreizwei), attack: get(:atk3), release: get(:rel3), pan: get(:pan), amp: get(:amp3)
    sleep(pause)
    play get(:dreidrei), attack: get(:atk3), release: get(:rel3), pan: get(:pan), amp: get(:amp3)
    sleep(pause)
    play get(:dreivier), attack: get(:atk3), release: get(:rel3), pan: get(:pan), amp: get(:amp3)
    sleep(pause)
  end
end


