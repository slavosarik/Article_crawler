require 'rails_helper'

RSpec.describe Article, :type => :model do
  it 'parses articles' do
    html = File.read(File.dirname(__FILE__) + '/fixtures/futbal.html', encoding: 'UTF-8')

    #html = Faraday.get 'http://sportky.topky.sk/s/13/futbal'
    #Article.parse_from_sportky(html.body)


    Article.parse_from_sportky(html)

    expect(Article.count).not_to eq(0)

    article = Article.first

    expect(article.title).to eq('Brazílčania opisujú debakel ako historickú hanbu: Nemecko urobilo z Brazílie mleté ​​mäso')
    expect(article.perex).to eq('RIO DE JANEIRO - Brazílska tlač je rovnako ako všetci fanúšikovia "kanárikov" zdrvená debaklom 1:7, ktorý domácim futbalistom uštedrili nemeckí reprezentanti v semifinále ...')
    expect(article.id_article).to eq(126863)

    puts "koniec"

  end

  it 'parses source' do

    #Article.find_each do |article|
    #  # html = Fara... .get article.url
    #  article.extract_source(html)
    #end

    html = # fixture
    article = Article.new(id_article: 123, title: 'aaa', perex: 'bbb')
    article.parse_source(html)

    expect(article.source).to eq('SITA')
    expect(article).to be_persisted
  end
end