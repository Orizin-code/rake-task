require 'csv'

# 名前空間 => import
namespace :import_csv do
  # タスクの説明
  desc 'CSVデータをインポートするタスク'

  # タスク名 => users
  task users: :environment do
    # インポートするファイルのパスを取得
    path = 'db/csv_data/csv_data.csv'
    # インポートするデータを格納するための配列
    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    puts 'インポート処理を開始'
    begin
      User.create!(list)
      puts 'インポート完了!!'
    rescue StandardError => e
      # 例外が発生した場合の処理
      # インポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}"
      puts '-------------------------'
      puts e.backtrace # 例外が発生した位置情報
      puts '-------------------------'
      puts 'インポートに失敗'
    end
  end
end
