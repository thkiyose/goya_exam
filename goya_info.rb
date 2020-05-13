# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new
# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  # 情報の目印とした"goya1","goya2"のデータを cgi['goya~']と言う記述で取り出し、ローカル変数に代入する
  get1 = cgi['goya1']
  get2 = cgi['goya2']
  # HTMLでレスポンスを返却する
  #cgi['button']でnameに"button"を設定したボタンから情報を取得し、ローカル変数に代入する
  b = cgi['button']
  # 押したボタンに対応したvalueによって違うデータを返す
  if b == "人にあげたゴーヤ一覧"
  "<html>
    <body>
      <p>渡した相手と売値の情報は下記になります</p>
      <table>
      #{get1}
      </table>
    </body>
  </html>"
  elsif b == "品質が悪かったゴーヤ一覧"
    "<html>
      <body>
        <p>品質が悪かったゴーヤの情報は下記になります</p>
        <table>
        #{get2}
        </table>
      </body>
    </html>"
  end
}
