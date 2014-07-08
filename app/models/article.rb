class Article < ActiveRecord::Base

    def self.parse_from_aktuality(html)
      doc = Nokogiri::HTML.parse(html)

      #TODO: upravit parsovanie podla HTML tagov

      doc.search('.article-box article-box-big article-box-section-1 .col-text').map do |div|
        anchor = div.search('h2 a').first
        Article.create!(
            id_article: anchor[:href][/\/(\d+)\//, 1].to_i,
            title: anchor.text,
            perex: div.search('p').text
        )
      end
    end

end
