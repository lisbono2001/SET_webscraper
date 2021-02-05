require "SET_Theetouch/version"

module SETTheetouch
  def scraper
    url = "https://www.set.or.th/set/commonslookup.do"
    parsed_page = Nokogiri::HTML(HTTParty.get(url).body)

    # loop through all page
    subpage_list ||= parsed_page.css('div.capital-letter').css('a')
    subpage_list.each do |subpage_listing|
      subpage_url ||= "https://www.set.or.th" + subpage_listing.attributes["href"].value
      subpage = Nokogiri::HTML(HTTParty.get(subpage_url).body)
      # loop through each company
      company_list = subpage.css('tr')[1..-1]
      company_list.each do |company_listing|
        print company_listing.css('td')[0].text + " : "
        print company_listing.css('td')[1].text + " : "

        # print each company asset
        company_url ||= "https://www.set.or.th" + company_listing.css('a')[0].attributes["href"].value
        company_page = Nokogiri::HTML(HTTParty.get(company_url).body)
        company_asset_url ||= "https://www.set.or.th" + company_page.css('ul.set-nav-tabs').css('a')[1].attributes["href"].value

        company_asset_page = Nokogiri::HTML(HTTParty.get(company_asset_url).body)
        asset_info = company_asset_page.css('table.table-info').css('tr')[2].css('td')  # select row
        puts asset_info[asset_info.length()-2].text
      end
    end
  end
end

class Output
  include SETTheetouch
end