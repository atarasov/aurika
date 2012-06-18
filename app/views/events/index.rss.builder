xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Аурика Цуркан - Президент федерации восточного танца г.Пенза"
    xml.description "Новости восточного танца в Пензе, статьи и другая информация"
    xml.link events_url

    for event in @events
      xml.item do
        xml.title event.title
        xml.description event.description
        xml.pubDate event.created_at.to_s(:rfc822)
        xml.link event_url(event)
        xml.guid event_url(event)
      end
    end
  end
end