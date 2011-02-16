module GamesHelper
  def format_roulette_num(num)
     return (num == -1) ? '00' : num.to_s
  end

end
