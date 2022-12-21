namespace :push_task do
  desc "LINEBOT：お土産購入日の通知" 
  task :push_line_message_shopping_day => :environment do
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }

    from = Time.current.beginning_of_day
    to = Time.current.end_of_day
    limit_shopping_day = Rodging.where(shopping_day: from..to)
    limit_shopping_day.each do |t|
      message = {
          type: 'text',
          text: "「今日はお土産の購入日です。#{t.address}」周辺で"
      }
      response = client.push_message(t.user_uid, message)
      p response
    end
  end
end
