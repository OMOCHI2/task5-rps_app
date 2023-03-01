#rps => Rock-Paper-Scissors
#fpg => Finger Pointing Game

result_rps = [] #第1引数：じゃんけんループ離脱判定用、第2引数：じゃんけん勝敗状態判定用 を格納する予定

#じゃんけん用
def rps(result, result_number)
  puts "じゃんけん..."
  puts "[1:グー  2:チョキ  3:パー  4:戦わない]"

  player_rps = gets.chomp.to_i.floor #ひねくれてる人用に小数点以下切り捨て
  program_rps = rand(1..3)
  puts"ホイ！"
  border

  if player_rps <= 0 || player_rps > 4 #ひねくれてる人用に選択肢以外の数値・文字列・nilを無効化。while抜けられず
    puts "ルールに則って対戦しましょう。さあ、もう一度"
    return [true, 0]
  elsif player_rps == 4 #戦わないを選択した場合。while抜けられず
    puts "逃げてはダメです、戦ってください"
    return [true, 0]
  end

  #ちゃんと勝負した場合
  rps_hands = ["グー", "チョキ", "パー"]
  puts "あなた：#{rps_hands[player_rps - 1]}を出しました"
  puts "相手：#{rps_hands[program_rps - 1]}を出しました"
  border

  if player_rps == program_rps #あいこ。while抜けられず
    puts "あいこです。もう一度！"
    return [true, 0]
  elsif (player_rps == 1 && program_rps == 2) \
    || (player_rps == 2 && program_rps == 3) \
    || (player_rps == 3 && program_rps == 1) #勝ち。while離脱
    return [false, 1]
  else #負け。while離脱
    return [false, 2]
  end
end

#あっち向いてホイ用
def fpg
  puts "あっち向いて〜"
  puts "[1:上  2:下  3:左  4:右]"

  player_fpg = gets.chomp.to_i.floor
  program_fpg = rand(1..4)
  puts"ホイ！"
  border

  if player_fpg <= 0 || player_fpg > 4
    puts "４択です！次からは上下左右から選びましょう。"
    return false
  end

  fpg_directions =["上", "下", "左", "右"]
  puts "あなた：#{fpg_directions[player_fpg - 1]}"
  puts "相手：#{fpg_directions[program_fpg - 1]}"
  border

  if player_fpg == program_fpg #向き一致。loop離脱
    return true
  else  #向き一致せず。loop再突入
    return false
  end
end

#区切り破線
def border
  puts "----------------"
end

#ターミナル表示部分ココから
border
puts "じゃんけんゲームを開始します！"

loop do
  result_rps = [true, 0] #初回突入時・loop時は初期値を代入

  while result_rps[0] #false(勝敗がついた)時、その記録を保持してwhileを離脱
    result_rps = rps(true, 0)
  end

  fpg_end = fpg

  break if fpg_end #true（方向が一緒）の時loopを離脱
end

# loop突破時、result_rps[1]は必ず１（勝利）か２（敗北）状態
if result_rps[1] == 1 #rps勝利状態でloop突破
  puts "\n《《《 YOU WIN !!! 》》》\n\n"
  border
else #rps敗北状態でloop突破
  puts "\n《《《 YOU LOSE ... 》》》\n\n"
  border
end