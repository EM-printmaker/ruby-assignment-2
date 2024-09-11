module Text
  def border
    print "-------------------------------------"
  end
end

class Rps
  include Text
  def initialize
    @rps_choices = ["グー" , "チョキ" , "パー"]
    @com_rps_type = rand(0..2)
    @com_rps_choice = @rps_choices[@com_rps_type]
  end

  def branch
    puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
    @rps_type = gets.chomp

    if @rps_type == "3"
      puts "また遊んでくださいね"
      exit
    elsif @rps_type =~ /^[0-2]+$/ && $count == 0
      puts "ショ！"
    elsif @rps_type =~ /^[0-2]+$/
      puts "ホイ！"
    else
      puts "不正な値です"
      exit
    end

    @rps_type = @rps_type.to_i
    @rps_choice = @rps_choices[@rps_type]
    puts border
    puts "あなた：#{@rps_choice}を出しました"
    puts "相手　：#{@com_rps_choice}を出しました"
    puts border
  end

  def win_or_lose
    if (@rps_type - @com_rps_type).modulo(3) == 2
      puts "あっち向いて〜"
      $draw = false
      $count = 1
    elsif (@rps_type - @com_rps_type).modulo(3) == 1
      puts "あっち向いて〜"
      $draw = false
      $count = 2
    elsif @rps_type == @com_rps_type
      puts "あいこで…"
      $draw = true
      $count = 0
    end
  end
end

class AcchimuiteHoi
  include Text
  def initialize
    @dir_choices = ["上" , "下" , "左" , "右"]
    @com_dir_type = rand(0..3)
    @com_dir_choice = @dir_choices[@com_dir_type]
  end

  def branch
    puts "0(上) 1(下) 2(左) 3(右)"
    @dir_type = gets.chomp

    if @dir_type =~ /^[0-3]+$/
      @dir_type = @dir_type.to_i
      @dir_choice = @dir_choices[@dir_type]
    else
      puts "不正な値です"
      exit
    end

    puts "ホイ！"
    puts border
    puts "あなた：#{@dir_choice}"
    puts "相手　：#{@com_dir_choice}"
    puts border
  end

  def win_or_lose
    if @dir_type != @com_dir_type
      puts "じゃんけん…"
      $draw = true
      $count = nil
    end
  
    case $count
    when 1
      puts "あなたの勝ちです"
      $draw = false
    when 2
      puts "あなたの負けです"
      $draw = false
    end
  end

end

$count = nil
$draw = true
puts "じゃんけん…"

while $draw do

  #じゃんけん開始
  rps = Rps.new()
  rps.branch()
  rps.win_or_lose()

  # あっち向いてホイ開始
  if $count == 1 || $count == 2
    acchimuite_hoi = AcchimuiteHoi.new()
    acchimuite_hoi.branch()
    acchimuite_hoi.win_or_lose()
  end

end