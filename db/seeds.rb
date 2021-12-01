require 'rest-client'
require 'pry'
require 'json'
#Park Codes for NPS API:
# acad,npsa,arch,badl,bibe,bisc,blca,brca,cany,care,cave,chis,cong,crla,cuva,deva,dena,drto,ever,gaar,jeff,glba,glac,grca,grte,grsa,grsm,gumo,hale,havo,hosp,indu,isro,jotr,seki,lavo,pinn,redw,yose,katm,kefj,kova,lacl,wrst,maca,meve,romo,pefo,sagu,mora,noca,olym,neri,shen,thro,viis,voya,whsa,wica,yell,zion

# park_data1['entranceFees'][0]['cost'] + " " +  park_data1['entranceFees'][0]['description']
# park_data1['addresses'][0]['city'] + ", " + park_data1['addresses'][0]['stateCode']
# park_data1['images'][0]['url']
# park_data1['latitude'].to_f
# park_data1['longitude'].to_f



User.destroy_all
Trip.destroy_all
Park.destroy_all

api_key = 'j295OpZ72mKfiYq6t80uMx7YGkPXuzAL3UmciyDf'
pry
#first 50 parks
api_resp1 = RestClient.get("https://developer.nps.gov/api/v1/parks?parkCode=acad,npsa,arch,badl,bibe,bisc,blca,brca,cany,care,cave,chis,cong,crla,cuva,deva,dena,drto,ever,gaar,jeff,glba,glac,grca,grte,grsa,grsm,gumo,havo,hosp,indu,isro,jotr,seki,lavo,pinn,redw,sagu,mora,pefo,romo,maca,lacl,wrst,katm,kefj,meve,kova&limit=50&start=0&api_key=#{api_key}")
api_data1 = JSON.parse(api_resp1)

#last 12 parks 
api_resp2 = RestClient.get("https://developer.nps.gov/api/v1/parks?parkCode=noca,olym,neri,shen,thro,voya,whsa,wica,yell,grba&limit=50&start=0&api_key=#{api_key}")
api_data2 = JSON.parse(api_resp2)

park_info1 = api_data1['data']

park_info2 = api_data2['data']


park_info1.each {|park_data| Park.create(name: park_data['fullName'], description: park_data['description'], location:park_data['addresses'][0]['city'] + ", " + park_data['addresses'][0]['stateCode'], lat: park_data['latitude'].to_f, long: park_data['longitude'].to_f, entrance_fees: park_data['entranceFees'][0]['cost'] + " " +  park_data['entranceFees'][0]['description'], img_url: park_data['images'][0]['url'], weather:park_data['weatherInfo'] ) }

park_info2.each {|park_data| Park.create(name: park_data['fullName'], description: park_data['description'], location:park_data['addresses'][0]['city'] + ", " + park_data['addresses'][0]['stateCode'], lat: park_data['latitude'].to_f, long: park_data['longitude'].to_f, entrance_fees: park_data['entranceFees'][0]['cost'] + " " +  park_data['entranceFees'][0]['description'], img_url: park_data['images'][0]['url'], weather:park_data['weatherInfo'] ) }

#manuals
yose = Park.create(name:"Yosemite National Park", description:"Not just a great valley, but a shrine to human foresight, the strength of granite, the power of glaciers, the persistence of life, and the tranquility of the High Sierra. First protected in 1864, Yosemite National Park is best known for its waterfalls, but within its nearly 1,200 square miles, you can find deep valleys, grand meadows, ancient giant sequoias, a vast wilderness area, and much more.", location:"CA", lat:37.84883288, long:-119.5571873, entrance_fees:"35.00 This fee is valid for seven days.", img_url: "https://www.nps.gov/common/uploads/structured_data/3C84CC4C-1DD8-B71B-0BE967E5E5D93F25.jpg", weather: "Yosemite National Park covers nearly 1,200 square miles (3,100 square km) in the Sierra Nevada, with elevations ranging from about 2,000 feet (600 m) to 13,000 ft (4,000 m). Yosemite receives 95% of its precipitation between October and May (and over 75% between November and March). Most of Yosemite is blanketed in snow from about November through May. (Yosemite Valley can be rainy or snowy in any given winter storm.)")
zion = Park.create(name:"Zion National Park", description: "Follow the paths where ancient native people and pioneers walked. Gaze up at massive sandstone cliffs of cream, pink, and red that soar into a brilliant blue sky. Experience wilderness in a narrow slot canyon. Zion’s unique array of plants and animals will enchant you as you absorb the rich history of the past and enjoy the excitement of present day adventures.", location:"Springdale, UT", lat: 37.29839254, long: -113.0265138, entrance_fees: "35.00 Admits private, non-commercial vehicle (15 passenger capacity or less) and all occupants to Zion National Park, including both the Zion Canyon and Kolob Canyon areas.", img_url: "https://www.nps.gov/npgallery/GetAsset/989D33A6-155D-451F-67B3A1B0E195D9E1/proxy/hires?", weather: "Zion is known for a wide range of weather conditions. Temperatures vary with changes in elevation and day/night temperatures may differ by over 30°F. In summer, temperatures in Zion National Park often exceed 100°F/38°C. Zion experiences monsoons from mid-July into September that result in an increased risk of flash floods. Always be aware of the threat of storms and lightning and be prepared for a wide range of weather conditions. Winters are generally mild.")
hale = Park.create(name:"Haleakalā National Park", description: "This special place vibrates with stories of ancient and modern Hawaiian culture and protects the bond between the land and its people. The park also cares for endangered species, some of which exist nowhere else. Come visit this special place - renew your spirit amid stark volcanic landscapes and sub-tropical rain forest with an unforgettable hike through the backcountry.", location:"Kula, HI", lat: 20.7204, long: -156.1552, entrance_fees: "30.00 Entry Fee is valid for 3 days starting from the day of purchase. Please use credit cards for payment of entry fees at the Summit and Kipahulu entrance stations. All park visitors are required to purchase a recreational use pass upon entering Haleakalā National Park. Passes are non-transferable.", img_url: "https://www.nps.gov/common/uploads/structured_data/3D05E583-1DD8-B71B-0BBFF82F7F78AF6A.jpg", weather: "On any given day, the temperatures in the park can range from a high of 80°F (27°C) in Kīpahulu to a low of 30°F (-1°C) at the summit. In either area clouds and rain can quickly replace warm sunshine. Weather in the high-elevation summit and wilderness areas of the park is highly unpredictable and changes often. Cool temperatures, intense solar radiation, and rapidly moving clouds are characteristic. On average, the temperature drops about 3°F for every 1,000 foot rise in elevation.")
viis = Park.create(name:"Virgin Islands National Park", description:"Virgin Islands National Park is more than just beautiful beaches. Hike to plantation ruins to learn about a time when sugar dominated the island. Visit the ancient petroglyphs carved by the Taino Indians. Come snorkel the coral reefs to discover hidden marine life. Two-thirds of the island of St. John is national park, making it a unique destination for visitors from around the world.", location:"St. John, VI", lat:18.34279656, long: -64.74194451, entrance_fees:"There is no entrance fee for Virgin Islands National Park", img_url: "https://www.nps.gov/common/uploads/structured_data/1F0534AF-91EB-443B-41760F790BE42778.jpg", weather: "Mostly Perfect! The Tradewinds (the Easterlies) dominate the weather in the Virgin Islands, blowing east to west across the tropical Atlantic. The winter tends to bring stronger winds and less rain, and the summer tends to bring more rain and lighter winds. Be sure to check the forecast often during hurricane season or winter swell events.")
hbra = Park.create(name:"Hebra Mountains National Park", description:"Hebra Mountains National Park is an icy region located up in the Northwest, just to the East of the Tabantha Frontier. It is a harsh climate, requiring the best cold resistant Armor and food to survive in, and boasts the towering Hebra Peak. Hebra is also a very dangerous area even besides the cold - as it is home to powerful Ice Lizalfos and mounted Bokoblins, and some Lynel even wander the snowfields in the North.", location:"HYRULE", lat:82.8628, long: 135.0000, entrance_fees:"300 Rupees This fee is valid for seven days.", img_url: "https://d24hkyf7t7q9y9.cloudfront.net/assets/article/2017/03/02/botwsn_feature.jpg", weather: "FREEZING!!!")







User.create(email:"test@test.com", name:'Chelsey', password: '123', bio:'testing', fav_park:'test park', junior_badge: false, ranger_badge: false, master_badge: false)
User.create(email:"jim@jim.com", name:'Jimmy', password:"1234", bio:"this is Jimmy's profile", fav_park:'HOPE THIS WORKS', junior_badge: false, ranger_badge: false, master_badge: false)

Trip.create(user_id: User.first.id, park_id: Park.first.id, length_of_trip:"5 days", review:"It was chill", img_url: "https://www.nps.gov/articles/images/ACAD_1.jpg?maxwidth=1200&autorotate=false", likes: 0, accommodations:"airbnb", what_to_pack:"testing")
Trip.create(user_id: User.first.id, park_id: Park.second.id, length_of_trip:"5 days", review:"This is Yosemite's review", img_url: "https://www.nps.gov/articles/images/ACAD_1.jpg?maxwidth=1200&autorotate=false", likes: 0, accommodations:"camping in the park", what_to_pack:"testing")
Trip.create(user_id: User.second.id, park_id: Park.third.id, length_of_trip:"10 days", review:"This is JIMMYS TRIP TO YOSE", img_url: "https://www.nps.gov/articles/images/ACAD_1.jpg?maxwidth=1200&autorotate=false", likes: 0, accommodations:"motel outside of the park", what_to_pack:"testing")