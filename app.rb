require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'uri'


get '/lol' do
    erb :lol
end

get '/search' do
    url = "http://www.op.gg/summoner/userName="
    @id = params[:userName]
    keyword = URI.encode(@id)
    response = HTTParty.get(url + keyword)
    text = Nokogiri::HTML(response.body)
    @win = text.css('#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins')
    @lose = text.css('#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses')
    erb :search
end

# get '/' do
#     "hello whale"
#     "<a href=http://www.naver.com>네이버</a>"
# end

get '/' do
    send_file 'index.html'
end

# get '/lunch' do
#     lunch = ["김밥", "20층", "순남시래기", "삼각김밥", "시골집", "컵라면"]
#     #menu = lunch.sample
#     #"추천 점심메뉴 : #{menu}"
#     @menu = lunch.sample
#     erb :lunch
# end


#강사님 풀이
get '/lunch' do
    lunch = ["김밥", "20층", "순남시래기"]
    @photos = {"김밥" => "http://www.gimgane.co.kr/board/data/file/menu/1935589795_afscgN0k_EAB980EAB080EB84A4EAB980EBB0A5_EC8B9CEAB888ECB998_.jpg",
              "20층" => "https://scontent-sea1-1.cdninstagram.com/t51.2885-15/s480x480/e35/20987024_1431422050287339_2004189507347283968_n.jpg?ig_cache_key=MTU4NzUwMTg2NjEwNzc3MTI0Nw%3D%3D.2",
              "순남시래기" => "http://soonnam.com/m/img/main/banner03.jpg"
             }
    @menu = lunch.sample
    erb :lunch
end

get '/lotto' do
    #lotto = (1..45).to_a.sample(6)
    #"로또번호 추천 : #{lotto}"
    @lotto = [*1..45].sample(6)
    erb :lotto
end

# get http요청????(dynamic web site)

# get '/welcome' do
#     "Welcome !"
# end

get '/welcome/:name' do
    "Welcome ! #{params[:name]} "
end

get '/cube/:num' do
    input = params[:num].to_i
    result = input ** 3
    "The result is #{result}"
end

