class Article < ActiveRecord::Base

    def self.parse_from_aktuality(html)
      doc = Nokogiri::HTML.parse(html)

      #TODO: upravit parsovanie podla HTML tagov

      doc.search('article-info-bottom').map do |div|
        anchor = div.search('a').first
        puts anchor
        Article.create!(
            id_article: anchor[:href][/\/(\d+)\//, 1].to_i,
            title: anchor.search('span').first.text,
            perex: div.search('article-introtext').text
        )
      end
    end

end


#class Article < ActiveRecord::Base
#  belongs_to :author
#
#  def self.parse_from_sme(html)
#    doc = Nokogiri::HTML.parse(html)
#
#    doc.search('.item-top .col-text').map do |div|
#      anchor = div.search('h2 a').first
#      Article.create!(
#          sme_id: anchor[:href][/\/(\d+)\//, 1].to_i,
#          title: anchor.text,
#          perex: div.search('p').text
#      )
#    end
#  end
#end