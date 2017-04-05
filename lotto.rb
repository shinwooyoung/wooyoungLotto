require('open-uri')
# 웹 페이지 open 에 필요.

# JSON을 Hash로 변환하는데 필요.
require('json')
#출력을 보기좋게 바꿔준다
require('awesome_print')


# page에 해당 웹 페이지를 열어서 저장.
page = open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=')

# lotto_info 에 page 내용 (JSON 형식의 data) 을 읽어서 저장.
lotto_info = page.read

#puts lotto_info
# lotto_hash 에 JSON 형식인 lotto_info 를 Hash 로 파싱(변환)하여 저장.
lotto_hash = JSON.parse(lotto_info)

#=> JSON 데이터가 Hash 로 변환되어 출력.
#puts lotto_hash



# 1. 'my_numbers'라는 배열에 1~45에서 6개 랜덤한 숫자 뽑아 정렬
my_numbers = (1..45).to_a.sample(6).sort

# 2. 웹에서 가져온 정보 정리

#    'drw_numbers'라는 배열에 이번주 추첨 번호 6개 저장

drw_numbers = Array.new
cnt = 0;
bonus_number = 0

lotto_hash.each do |l, num| #num이 당첨숫자
    if l.include?"drwtNo"
        drw_numbers[cnt] = num
        cnt += 1
    end
    
    if l.include?"bnusNo"
        bonus_number = num
    end
end

drw_numbers.sort!

print "이번주 로또 번호는 #{drw_numbers}이고, 보너스 번호는 #{bonus_number} 입니다."
puts
        
#    'bonus_number' 변수에 이번주 보너스 번호 저장 


# 3. 랜덤으로 뽑은 나의 번호와 실제 추첨 번호 비교

#    'match_numbers' 라는 배열에 랜덤 추첨번호와 이번주 당첨번호 중에서 겹치는 번호를 저장한다. 
match_numbers = Array.new

cnt = 0
ar = 0

6.times do
    drw_numbers.each do |d_n|
        if my_numbers[cnt] == d_n
            match_numbers[ar] = d_n
            ar += 1
        end
    end
    cnt += 1
end

print "추첨한 로또 번호는 #{my_numbers} 입니다."
puts

print "겹치는 번호는 #{match_numbers} 입니다."
puts

#    <로또 당첨 규칙>

#    1등 : 번호 6개가 모두 같을 경우
#    2등 : 번호 6개 중 5개가 같고 보너스 번호가 맞은 경우
#    3등 : 번호 6개 중 5개가 같을 경우
#    4등 : 번호 6개 중 4개가 같을 경우
#    5등 : 번호 6개 중 3개가 같을 경우
#    그 외 : 꽝
check = 0

my_numbers.each do |c|
    if c == bonus_number
        check = 1
    end
end

    print "결과는 "
    if match_numbers.length == 6
        print "1등입니다!!!! "
    elsif match_numbers.length == 5 && check == 1
        print "2등입니다!!! "
    elsif match_numbers.length == 5
        print "3등입니다!! "
    elsif match_numbers.length == 4
        print "4등입니다! "
    elsif match_numbers.length == 3
        print "5등입니다. "
    else
        print "꽝! "
    end
    print "입니다."
    puts

# 4. 결과 출력

#    이번주 로또 번호는 [1, 2, 3, 9, 12, 23] 이고, 보너스 번호는 10 입니다.
#      추첨한 로또 번호는 [4, 9, 12, 17, 28, 37] 입니다.
#      겹치는 번호는 [9, 12] 입니다.
#      결과는 꽝 입니다.

