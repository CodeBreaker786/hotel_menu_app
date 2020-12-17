  

import 'dart:convert';


 

import 'package:arc360menu/src/values/app_keys.dart';

import 'in_memory_cache.dart';


buildDataObj() async {


//  String dataSourceJson = await rootBundle.loadString(assets/data.json);
//  String dataSourceJson = await DefaultAssetBundle.of(context).loadString(assets/data.json)


  String dataSource4 = '[{"type":"table","name":"dish","database":"arc360_menu","data":[{"dish_id":"1","dish_name":"Sp. Chicken Soup","description":"Special Chicken Soup","image":"","portions":"1","price1":"155","price2":"0","cat_id":"1","scat_id":"1","is_veg":"0"},{"dish_id":"2","dish_name":"Crab Meat Soup","description":"Crab Meat soup","image":"","portions":"1","price1":"175","price2":"0","cat_id":"1","scat_id":"1","is_veg":"0"},{"dish_id":"3","dish_name":"Paya Soup","description":"This is Paya Soup.","image":"","portions":"1","price1":"165","price2":"0","cat_id":"1","scat_id":"1","is_veg":"0"},{"dish_id":"4","dish_name":"Alu Wadi","description":"Alu Wadi","image":"","portions":"1","price1":"105","price2":"0","cat_id":"2","scat_id":"3","is_veg":"0"},{"dish_id":"5","dish_name":"Kothimbirwadi","description":"Kothimbirwadi","image":"","portions":"1","price1":"105","price2":"0","cat_id":"2","scat_id":"3","is_veg":"0"},{"dish_id":"6","dish_name":"Veg Pakoda","description":"Veg Pakoda","image":"","portions":"1","price1":"115","price2":"0","cat_id":"2","scat_id":"3","is_veg":"0"},{"dish_id":"7","dish_name":"Bombil Bhaji","description":"Bombil Bhaji","image":"","portions":"1","price1":"185","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"8","dish_name":"Bombil Crispy","description":"Bombil Crispy","image":"","portions":"1","price1":"195","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"9","dish_name":"Fish Koliwada","description":"Fish Koliwada","image":"","portions":"1","price1":"305","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"10","dish_name":"Fish Finger","description":"Fish Finger","image":"","portions":"1","price1":"215","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"11","dish_name":"Jawla Bhaji","description":"Jawla bhaji","image":"","portions":"1","price1":"175","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"12","dish_name":"Prawns Koliwada","description":"Prawns Koliwada","image":"","portions":"1","price1":"325","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"13","dish_name":"Prawns Koshimbir","description":"Prawns Koshimbir","image":"","portions":"1","price1":"335","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"14","dish_name":"  Prawns Crispy","description":"Prawns Crispy","image":"","portions":"1","price1":"335","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"15","dish_name":"Prawns Crispy","description":"Prawns Crispy","image":"","portions":"1","price1":"335","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"16","dish_name":"Prawns Green Masala ","description":"Prawns Green Masala Tawa Fry","image":"","portions":"1","price1":"345","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"17","dish_name":"Fish Platter","description":"1 Promfret, 1 Bangda, 3 Bombil, 1 Surmai, Fish Pakoda, Basa, 4 Pcs Prawns, 4 Pcs Fish Finger Mandeli","image":"","portions":"1","price1":"1275","price2":"0","cat_id":"2","scat_id":"3","is_veg":"1"},{"dish_id":"18","dish_name":"Veg. Saguti","description":"Veg. Saguti","image":"","portions":"1","price1":"175","price2":"0","cat_id":"3","scat_id":"5","is_veg":"0"},{"dish_id":"19","dish_name":"Dalimbi Usal","description":"Dalimbi Usal","image":"","portions":"1","price1":"145","price2":"0","cat_id":"3","scat_id":"5","is_veg":"0"},{"dish_id":"20","dish_name":"Vangi Bharit","description":"Vangi Bharit","image":"","portions":"1","price1":"155","price2":"0","cat_id":"3","scat_id":"5","is_veg":"0"},{"dish_id":"21","dish_name":"Pithle Bhakri","description":"Pithle Bhakri","image":"","portions":"1","price1":"155","price2":"0","cat_id":"3","scat_id":"5","is_veg":"0"},{"dish_id":"22","dish_name":"Kala Watana Usal","description":"Kala Watana Usal","image":"","portions":"1","price1":"135","price2":"0","cat_id":"3","scat_id":"5","is_veg":"0"},{"dish_id":"23","dish_name":"Matki Usal","description":"Matki Usal","image":"","portions":"1","price1":"135","price2":"0","cat_id":"3","scat_id":"5","is_veg":"0"},{"dish_id":"24","dish_name":"Valache Bhirde","description":"Valache Bhirde","image":"","portions":"1","price1":"135","price2":"0","cat_id":"3","scat_id":"5","is_veg":"0"},{"dish_id":"25","dish_name":"Akkha Masoor","description":"Akkha Masoor","image":"","portions":"1","price1":"135","price2":"0","cat_id":"3","scat_id":"5","is_veg":"0"},{"dish_id":"26","dish_name":"Chicken Saguti","description":"Chicken Saguti","image":"","portions":"1","price1":"175","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"27","dish_name":"Chicken Suka","description":"Chicken Suka","image":"","portions":"1","price1":"195","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"28","dish_name":"Chicken Liver Saguti","description":"Chicken Liver Saguti","image":"","portions":"1","price1":"185","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"29","dish_name":"Chicken Liver Suka","description":"Chicken Liver Suka","image":"","portions":"1","price1":"195","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"30","dish_name":"Chicken Saguti Wade","description":"Chicken Saguti Wade","image":"","portions":"1","price1":"255","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"31","dish_name":"Spl. Chicken Handi Full","description":"Spl. Chicken Handi (F) (for 5-6 person)","image":"","portions":"1","price1":"415","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"32","dish_name":"Spl. Chicken Handi Half","description":"Spl. Chicken Handi (H) (for 3-4 person)","image":"","portions":"1","price1":"275","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"33","dish_name":"Chefs Spl Chicken Saguti Fry Curry","description":"Chefs Spl Chicken Saguti Fry Curry","image":"","portions":"1","price1":"295","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"34","dish_name":"Bheja Fry","description":"Bheja Fry","image":"","portions":"1","price1":"235","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"35","dish_name":"Kheema Fry","description":"Kheema Fry","image":"","portions":"1","price1":"285","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"36","dish_name":"Kheema Masala","description":"Kheema Masala","image":"","portions":"1","price1":"265","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"37","dish_name":"Mutton Saguti","description":"Mutton Saguti","image":"","portions":"1","price1":"255","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"38","dish_name":"Mutton Suka","description":"Mutton Suka","image":"","portions":"1","price1":"275","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"39","dish_name":"Chefs Spl Mutton Saguti Fry Curry","description":"Chefs Spl Mutton Saguti Fry Curry","image":"null","portions":"1","price1":"345","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"40","dish_name":"Spl. Mutton Handi Full","description":"Spl. Mutton Handi Full (F) (for 5-6 person)","image":"","portions":"1","price1":"645","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"41","dish_name":"Spl. Mutton Handi Half","description":"Spl. Mutton Handi Half (H) (for 3-4 person)","image":"","portions":"1","price1":"375","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"42","dish_name":"Wajri Fry","description":"Wajri Fry","image":"","portions":"1","price1":"185","price2":"0","cat_id":"4","scat_id":"7","is_veg":"1"},{"dish_id":"43","dish_name":"Curd Rice","description":"Curd Rice","image":"","portions":"1","price1":"135","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"44","dish_name":"Dal Khichdi","description":"Dal Khichdi","image":"","portions":"1","price1":"155","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"45","dish_name":"Jeera Rice","description":"Jeera Rice","image":"","portions":"1","price1":"115","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"46","dish_name":"Masala Rice","description":"Masala Rice","image":"","portions":"1","price1":"145","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"47","dish_name":"Plain Rice","description":"Plain Rice","image":"","portions":"1","price1":"85","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"48","dish_name":"Steam Rice","description":"Steam Rice","image":"","portions":"1","price1":"95","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"49","dish_name":"Palak Khichdi","description":"Palak Khichdi","image":"","portions":"1","price1":"145","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"50","dish_name":"Paneer Biryani","description":"Paneer Biryani","image":"","portions":"1","price1":"195","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"51","dish_name":"Veg. Pulav","description":"Veg. Pulav","image":"","portions":"1","price1":"155","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"52","dish_name":"Veg. Biryani","description":"Veg. Biryani","image":"","portions":"1","price1":"175","price2":"0","cat_id":"11","scat_id":"9","is_veg":"0"},{"dish_id":"53","dish_name":"Veg. Fried Rice","description":"Veg. Fried Rice","image":"","portions":"1","price1":"165","price2":"0","cat_id":"11","scat_id":"10","is_veg":"0"},{"dish_id":"54","dish_name":"Veg. Schezwan Rice ","description":"Veg. Schezwan Rice ","image":"","portions":"1","price1":"175","price2":"0","cat_id":"11","scat_id":"10","is_veg":"0"},{"dish_id":"55","dish_name":"Veg. Manchurian Rice","description":"Veg. Manchurian Rice","image":"","portions":"1","price1":"195","price2":"0","cat_id":"11","scat_id":"10","is_veg":"0"},{"dish_id":"56","dish_name":"Veg. Triple Schezwan Rice","description":"Veg. Triple Schezwan Rice","image":"","portions":"1","price1":"215","price2":"0","cat_id":"11","scat_id":"10","is_veg":"0"},{"dish_id":"57","dish_name":"Chicken Fried Rice","description":"Chicken Fried Rice","image":"","portions":"1","price1":"175","price2":"0","cat_id":"11","scat_id":"10","is_veg":"1"},{"dish_id":"58","dish_name":"Chicken Schezwan Rice","description":"Chicken Schezwan Rice","image":"","portions":"1","price1":"185","price2":"0","cat_id":"11","scat_id":"10","is_veg":"1"},{"dish_id":"59","dish_name":"Chicken Manchurian Rice","description":"Chicken Manchurian Rice","image":"","portions":"1","price1":"215","price2":"0","cat_id":"11","scat_id":"10","is_veg":"1"},{"dish_id":"60","dish_name":"Chicken Triple Schezwan Rice","description":"Chicken Triple Schezwan Rice","image":"","portions":"1","price1":"235","price2":"0","cat_id":"11","scat_id":"10","is_veg":"1"},{"dish_id":"61","dish_name":"Egg Fried Rice","description":"Egg Fried Rice","image":"","portions":"1","price1":"155","price2":"0","cat_id":"11","scat_id":"10","is_veg":"1"},{"dish_id":"62","dish_name":"Prawns Fried Rice","description":"Prawns Fried Rice","image":"","portions":"1","price1":"325","price2":"0","cat_id":"11","scat_id":"10","is_veg":"1"},{"dish_id":"63","dish_name":"Bombil Chatni","description":"Bombil Chatni","image":"","portions":"1","price1":"125","price2":"0","cat_id":"5","scat_id":null,"is_veg":"1"},{"dish_id":"64","dish_name":"Jawala Chatni","description":"Jawala Chatni","image":"","portions":"1","price1":"125","price2":"0","cat_id":"5","scat_id":null,"is_veg":"1"},{"dish_id":"65","dish_name":"Jawala Wangi Batata","description":"Jawala Wangi Batata","image":"","portions":"1","price1":"135","price2":"0","cat_id":"5","scat_id":null,"is_veg":"1"},{"dish_id":"66","dish_name":"Boiled Egg","description":"Boiled Egg","image":"","portions":"1","price1":"55","price2":"0","cat_id":"6","scat_id":null,"is_veg":"1"},{"dish_id":"67","dish_name":"Egg Curry","description":"Egg Curry","image":"","portions":"1","price1":"135","price2":"0","cat_id":"6","scat_id":null,"is_veg":"1"},{"dish_id":"68","dish_name":"Egg Masala","description":"Egg Masala","image":"","portions":"1","price1":"125","price2":"0","cat_id":"6","scat_id":null,"is_veg":"1"},{"dish_id":"69","dish_name":"Egg Omlet","description":"Egg Omlet","image":"","portions":"1","price1":"85","price2":"0","cat_id":"6","scat_id":null,"is_veg":"1"},{"dish_id":"70","dish_name":"Egg Bhurji","description":"Egg Bhurji","image":"","portions":"1","price1":"105","price2":"0","cat_id":"6","scat_id":null,"is_veg":"1"},{"dish_id":"71","dish_name":"Tomato Soup","description":"Tomato Soup","image":"","portions":"1","price1":"105","price2":"0","cat_id":"1","scat_id":"2","is_veg":"0"},{"dish_id":"72","dish_name":"Veg. Hot & Sour Soup","description":"Veg. Hot & Sour Soup","image":"","portions":"1","price1":"115","price2":"0","cat_id":"1","scat_id":"2","is_veg":"0"},{"dish_id":"73","dish_name":"Veg. Manchow Soup","description":"Veg. Manchow Soup","image":"","portions":"1","price1":"115","price2":"0","cat_id":"1","scat_id":"2","is_veg":"0"},{"dish_id":"74","dish_name":"Veg. Clear Soup","description":"Veg. Clear Soup","image":"","portions":"1","price1":"105","price2":"0","cat_id":"1","scat_id":"2","is_veg":"0"},{"dish_id":"75","dish_name":"Paneer Tikka","description":"Paneer Tikka","image":"","portions":"1","price1":"195","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"76","dish_name":"Veg Seekh Kabab","description":"Veg Seekh Kabab","image":"","portions":"1","price1":"245","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"77","dish_name":"Paneer 65","description":"Paneer 65","image":"","portions":"1","price1":"195","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"78","dish_name":"Paneer Pakoda","description":"Paneer Pakoda","image":"","portions":"1","price1":"175","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"79","dish_name":"Paneer Koliwada","description":"Paneer Koliwada","image":"","portions":"1","price1":"175","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"80","dish_name":"Paneer Satay","description":"Paneer Satay","image":"","portions":"1","price1":"225","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"81","dish_name":"Paneer Manchurian","description":"Paneer Manchurian","image":"","portions":"1","price1":"185","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"82","dish_name":"Paneer Chilly","description":"Paneer Chilly","image":"","portions":"1","price1":"185","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"83","dish_name":"Veg. Crispy","description":"Veg. Crispy","image":"","portions":"1","price1":"165","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"84","dish_name":"Veg. Manchurian","description":"Veg. Manchurian","image":"","portions":"1","price1":"175","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"85","dish_name":"Hara Bhara Kabab","description":"Hara Bhara Kabab","image":"","portions":"1","price1":"185","price2":"0","cat_id":"2","scat_id":"4","is_veg":"0"},{"dish_id":"86","dish_name":"Chiken Lollypop","description":"Chiken Lollypop","image":"","portions":"1","price1":"175","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"87","dish_name":"Chicken Crispy","description":"Chicken Crispy","image":"","portions":"1","price1":"215","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"88","dish_name":"Chicken Jumbo","description":"Chicken Jumbo","image":"","portions":"1","price1":"295","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"89","dish_name":"Chicken Pakoda","description":"Chicken Pakoda","image":"","portions":"1","price1":"215","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"90","dish_name":"Chicken Liver Potta Fry","description":"Chicken Liver Potta Fry","image":"","portions":"1","price1":"185","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"91","dish_name":"Chicken Liver Fry","description":"Chicken Liver Fry","image":"","portions":"1","price1":"195","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"92","dish_name":"Chicken Satay","description":"Chicken Satay","image":"","portions":"1","price1":"295","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"93","dish_name":"Chicken Kheema Pakoda","description":"Chicken Kheema Pakoda","image":"","portions":"1","price1":"225","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"94","dish_name":"Chicken Masala","description":"Chicken Masala (8 Pcs)","image":"","portions":"1","price1":"215","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"95","dish_name":"Egg Pakoda","description":"Egg Pakoda","image":"","portions":"1","price1":"145","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"96","dish_name":"Chicken 65","description":"Chicken 65","image":"","portions":"1","price1":"215","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"97","dish_name":"Mutton Kheema Pakoda","description":"Mutton Kheema Pakoda","image":"","portions":"1","price1":"265","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"98","dish_name":"Fish Manchurian","description":"Fish Manchurian","image":"","portions":"1","price1":"265","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"99","dish_name":"Fish Chilly","description":"Fish Chilly","image":"","portions":"1","price1":"275","price2":"0","cat_id":"2","scat_id":"4","is_veg":"1"},{"dish_id":"100","dish_name":"Alu Matter","description":"Alu Matter","image":"","portions":"1","price1":"155","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"101","dish_name":"Bhendi Masala","description":"Bhendi Masala","image":"","portions":"1","price1":"165","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"102","dish_name":"Chana Masala","description":"Chana Masala","image":"","portions":"1","price1":"155","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"103","dish_name":"Chana Masala Fry","description":"Chana Masala Fry","image":"","portions":"1","price1":"165","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"104","dish_name":"Jira Potato","description":"Jira Potato","image":"","portions":"1","price1":"115","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"105","dish_name":"Paneer Handi","description":"Paneer Handi (for 3-5 person)","image":"","portions":"1","price1":"275","price2":"0","cat_id":"3","scat_id":"4","is_veg":"0"},{"dish_id":"106","dish_name":"Veg. Handi","description":"Veg. Handi","image":"","portions":"1","price1":"245","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"107","dish_name":"Mushroom Babycorn Masala","description":"Mushroom Babycorn Masala","image":"","portions":"1","price1":"195","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"108","dish_name":"Mushroom Masala","description":"Mushroom Masala","image":"","portions":"1","price1":"195","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"109","dish_name":"Mutter Paneer","description":"Mutter Paneer","image":"","portions":"1","price1":"175","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"110","dish_name":"Palak Paneer","description":"Palak Paneer","image":"","portions":"1","price1":"175","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"111","dish_name":"Paneer Masala","description":"Paneer Masala","image":"","portions":"1","price1":"175","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"112","dish_name":"Paneer Bhurjee","description":"Paneer Bhurjee","image":"","portions":"1","price1":"185","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"113","dish_name":"Paneer Tikka Masala","description":"Paneer Tikka Masala","image":"","portions":"1","price1":"225","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"114","dish_name":"Paneer Kofta","description":"Paneer Kofta","image":"","portions":"1","price1":"225","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"115","dish_name":"Paneer Kolhapuri","description":"Paneer Kolhapuri","image":"","portions":"1","price1":"175","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"116","dish_name":"Stuff Capsicum","description":"Stuff Capsicum","image":"","portions":"1","price1":"165","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"117","dish_name":"Tomato Bhurjee","description":"Tomato Bhurjee","image":"","portions":"1","price1":"145","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"118","dish_name":"Veg. Kofta","description":"Veg. Kofta","image":"","portions":"1","price1":"195","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"119","dish_name":"Veg. Kolhapuri","description":"Veg. Kolhapuri","image":"","portions":"1","price1":"165","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"120","dish_name":"Veg. Kurma","description":"Veg. Kurma","image":"","portions":"1","price1":"165","price2":"0","cat_id":"3","scat_id":"6","is_veg":"0"},{"dish_id":"121","dish_name":"Chicken Tikka Masala","description":"Chicken Tikka Masala","image":"","portions":"1","price1":"225","price2":"0","cat_id":"3","scat_id":"6","is_veg":"1"},{"dish_id":"122","dish_name":"Butter Chicken","description":"Butter Chicken","image":"","portions":"1","price1":"225","price2":"0","cat_id":"4","scat_id":"8","is_veg":"1"},{"dish_id":"123","dish_name":"Malwani Murg Musslam Full","description":"Malwani Murg Musslam Full","image":"","portions":"1","price1":"645","price2":"0","cat_id":"4","scat_id":"8","is_veg":"1"},{"dish_id":"124","dish_name":"Malwani Murg Masslam Half","description":"Malwani Murg Masslam Half","image":"","portions":"1","price1":"365","price2":"0","cat_id":"4","scat_id":"8","is_veg":"1"},{"dish_id":"125","dish_name":"Dal Fry","description":"Dal Fry","image":"","portions":"1","price1":"115","price2":"0","cat_id":"9","scat_id":null,"is_veg":"0"},{"dish_id":"126","dish_name":"Dal Tadka","description":"Dal Tadka","image":"","portions":"1","price1":"125","price2":"0","cat_id":"9","scat_id":null,"is_veg":"0"},{"dish_id":"127","dish_name":"Dal Kolhapuri","description":"Dal Kolhapuri","image":"","portions":"1","price1":"125","price2":"0","cat_id":"9","scat_id":null,"is_veg":"0"},{"dish_id":"128","dish_name":"Plain Dal","description":"Plain Dal","image":"","portions":"1","price1":"85","price2":"0","cat_id":"9","scat_id":null,"is_veg":"0"},{"dish_id":"129","dish_name":"Chicken Tandoori Red Full","description":"Chicken Tandoori Red (F)","image":"","portions":"1","price1":"345","price2":"0","cat_id":"10","scat_id":null,"is_veg":"1"},{"dish_id":"130","dish_name":"Chicken Tandoori Red Half","description":"Chicken Tandoori Red Half","image":"","portions":"1","price1":"205","price2":"0","cat_id":"10","scat_id":null,"is_veg":"1"},{"dish_id":"131","dish_name":"Chicken Tandoori White Full","description":"Chicken Tandoori White Full","image":"","portions":"1","price1":"345","price2":"0","cat_id":"10","scat_id":null,"is_veg":"1"},{"dish_id":"132","dish_name":"Chicken Tandoori White Half","description":"Chicken Tandoori White Half","image":"","portions":"0","price1":"205","price2":"0","cat_id":"10","scat_id":null,"is_veg":"1"},{"dish_id":"133","dish_name":"Chicken Tikka","description":"Chicken Tikka","image":"","portions":"1","price1":"225","price2":"0","cat_id":"10","scat_id":null,"is_veg":"1"},{"dish_id":"134","dish_name":"Chicken Pahadi Kabab","description":"Chicken Pahadi Kabab","image":"","portions":"1","price1":"245","price2":"0","cat_id":"10","scat_id":null,"is_veg":"1"},{"dish_id":"135","dish_name":"Chicken Pahadi Kabab","description":"Chicken Pahadi Kabab","image":"","portions":"1","price1":"245","price2":"0","cat_id":"10","scat_id":null,"is_veg":"1"},{"dish_id":"136","dish_name":"Chicken Reshmi Kabab","description":"Chicken Reshmi Kabab","image":"","portions":"1","price1":"245","price2":"0","cat_id":"10","scat_id":null,"is_veg":"1"},{"dish_id":"137","dish_name":"Chicken Biryani","description":"Chicken Biryani","image":"","portions":"1","price1":"185","price2":"0","cat_id":"12","scat_id":null,"is_veg":"1"},{"dish_id":"138","dish_name":"Chicken Tikka Biryani","description":"Chicken Tikka Biryani","image":"","portions":"1","price1":"255","price2":"0","cat_id":"12","scat_id":null,"is_veg":"1"},{"dish_id":"139","dish_name":"Egg Biryani","description":"Egg Biryani","image":"","portions":"1","price1":"155","price2":"0","cat_id":"12","scat_id":null,"is_veg":"1"},{"dish_id":"140","dish_name":"Fish Biryani","description":"Fish Biryani (Surmai\/Rawas)","image":"","portions":"1","price1":"325","price2":"0","cat_id":"12","scat_id":null,"is_veg":"1"},{"dish_id":"141","dish_name":"Chapati","description":"Chapati","image":"","portions":"1","price1":"15","price2":"0","cat_id":"13","scat_id":null,"is_veg":"0"},{"dish_id":"142","dish_name":"Ghavne","description":"Ghavne","image":"","portions":"0","price1":"1","price2":"28","cat_id":"13","scat_id":null,"is_veg":"0"},{"dish_id":"143","dish_name":"Puri","description":"Puri (5 Pcs)","image":"","portions":"1","price1":"75","price2":"0","cat_id":"13","scat_id":null,"is_veg":"0"},{"dish_id":"144","dish_name":"Bhakari","description":"Bhakari (Rice\/Jowar\/Nachni)","image":"","portions":"1","price1":"28","price2":"0","cat_id":"13","scat_id":null,"is_veg":"0"},{"dish_id":"145","dish_name":"Vade","description":"Vade (5 Pcs)","image":"","portions":"1","price1":"85","price2":"0","cat_id":"13","scat_id":null,"is_veg":"0"},{"dish_id":"146","dish_name":"Aamboli","description":"Aamboli","image":"","portions":"1","price1":"35","price2":"0","cat_id":"13","scat_id":null,"is_veg":"0"},{"dish_id":"147","dish_name":"Bundi Dahi Raita","description":"Bundi Dahi Raita","image":"","portions":"1","price1":"95","price2":"0","cat_id":"14","scat_id":null,"is_veg":"0"},{"dish_id":"148","dish_name":"Dahi Koshimbir","description":"Dahi Koshimbir","image":"","portions":"1","price1":"75","price2":"0","cat_id":"14","scat_id":null,"is_veg":"0"},{"dish_id":"149","dish_name":"Plain Papad","description":"Plain Papad","image":"","portions":"1","price1":"25","price2":"0","cat_id":"14","scat_id":null,"is_veg":"0"},{"dish_id":"150","dish_name":"Masala Papad","description":"Masala Papad","image":"","portions":"1","price1":"45","price2":"0","cat_id":"14","scat_id":null,"is_veg":"0"},{"dish_id":"151","dish_name":"Kokam Sarbat","description":"Kokam Sarbat","image":"","portions":"1","price1":"45","price2":"0","cat_id":"15","scat_id":null,"is_veg":"0"},{"dish_id":"152","dish_name":"Buttermilk","description":"Buttermilk","image":"","portions":"1","price1":"35","price2":"0","cat_id":"15","scat_id":null,"is_veg":"0"},{"dish_id":"153","dish_name":"Panhe","description":"Panhe","image":"","portions":"1","price1":"45","price2":"0","cat_id":"15","scat_id":null,"is_veg":"0"},{"dish_id":"154","dish_name":"Limbu Sarbat","description":"Limbu Sarbat","image":"","portions":"1","price1":"45","price2":"0","cat_id":"15","scat_id":null,"is_veg":"0"},{"dish_id":"155","dish_name":"Limbu Soda","description":"Limbu Soda","image":"","portions":"1","price1":"65","price2":"0","cat_id":"15","scat_id":null,"is_veg":"0"},{"dish_id":"156","dish_name":"Solkadi","description":"Solkadi","image":"","portions":"1","price1":"45","price2":"0","cat_id":"15","scat_id":null,"is_veg":"0"},{"dish_id":"157","dish_name":"Veg. Thali","description":"(Sukhi Bhaji, Usal, Dal, RIce, Koshimbir, Sweet Solkadi, Papad)","image":"","portions":"1","price1":"175","price2":"0","cat_id":"16","scat_id":null,"is_veg":"0"},{"dish_id":"158","dish_name":"Chicken Thali","description":"(Chicken Saguti, Tambda Rassa, Rice, Solkadi, Salad)","image":"","portions":"1","price1":"215","price2":"0","cat_id":"16","scat_id":null,"is_veg":"1"},{"dish_id":"159","dish_name":"Special Chicken Thali","description":"(Chicken Suka, Tambda Rassa, Chicken Gravy, Lollypop, Chicken Biryani, Koshimbir, Solkadi, Salad)","image":"","portions":"1","price1":"285","price2":"0","cat_id":"16","scat_id":null,"is_veg":"1"},{"dish_id":"160","dish_name":"Mutton Thali","description":"(Mutton Saguti, Mutton Gravy, Tambda Rassa, Solkadi, Salad)","image":"","portions":"1","price1":"345","price2":"0","cat_id":"16","scat_id":null,"is_veg":"1"},{"dish_id":"161","dish_name":"Special Mutton Thali","description":"(Mutton Suka, Mutton Gravy, Tambda Rassa, Kheema Pakoda, Mutton Biryani, Solkadi, Salad)","image":"","portions":"1","price1":"345","price2":"0","cat_id":"16","scat_id":null,"is_veg":"1"},{"dish_id":"162","dish_name":"Gulabjamun","description":"Gulabjamun (2 Pcs)","image":"","portions":"1","price1":"65","price2":"0","cat_id":"17","scat_id":null,"is_veg":"0"},{"dish_id":"163","dish_name":"Modak","description":"Only on Tuesday","image":"","portions":"1","price1":"30","price2":"0","cat_id":"17","scat_id":null,"is_veg":"0"},{"dish_id":"164","dish_name":"Puranpoli","description":"Puranpoli","image":"","portions":"1","price1":"30","price2":"0","cat_id":"17","scat_id":null,"is_veg":"0"},{"dish_id":"165","dish_name":"Kheer","description":"Kheer","image":"","portions":"1","price1":"75","price2":"0","cat_id":"17","scat_id":null,"is_veg":"0"},{"dish_id":"166","dish_name":"Dudhi Halwa","description":"Dudhi Halwa","image":"","portions":"1","price1":"85","price2":"0","cat_id":"17","scat_id":null,"is_veg":"0"},{"dish_id":"167","dish_name":"Gajar Halwa","description":"Gajar Halwa","image":"","portions":"1","price1":"85","price2":"0","cat_id":"17","scat_id":null,"is_veg":"0"}]},{"type":"table","name":"menu","database":"arc360_menu","data":[{"cat_id":"1","cat_name":"Soup","has_sc":"1"},{"cat_id":"2","cat_name":"Starters","has_sc":"1"},{"cat_id":"3","cat_name":"Veg Main Course","has_sc":"1"},{"cat_id":"4","cat_name":"Non-veg Main Course","has_sc":"1"},{"cat_id":"5","cat_name":"Dry Fish","has_sc":"0"},{"cat_id":"6","cat_name":"Eggs","has_sc":"0"},{"cat_id":"7","cat_name":"Fish Masala \/ Suka","has_sc":"0"},{"cat_id":"8","cat_name":"Fish Fry","has_sc":"0"},{"cat_id":"9","cat_name":"Dal","has_sc":"0"},{"cat_id":"10","cat_name":"Tandoori \/ Kabab","has_sc":"0"},{"cat_id":"11","cat_name":"Rice \/ Biryani","has_sc":"1"},{"cat_id":"12","cat_name":"Non-veg Biryani","has_sc":"0"},{"cat_id":"13","cat_name":"Chapati \/ Bhakri","has_sc":"0"},{"cat_id":"14","cat_name":"Assorted Accomplishm","has_sc":"0"},{"cat_id":"15","cat_name":"Sharbat","has_sc":"0"},{"cat_id":"16","cat_name":"Thali","has_sc":"0"},{"cat_id":"17","cat_name":"Sweets","has_sc":"0"},{"cat_id":"18","cat_name":"Review Order","has_sc":"0"}]},{"type":"table","name":"subcategory","database":"arc360_menu","data":[{"scat_id":"1","scat_name":"Specials","cat_id":"1"},{"scat_id":"2","scat_name":"Punjabi & Chinese","cat_id":"1"},{"scat_id":"3","scat_name":"Specials","cat_id":"2"},{"scat_id":"4","scat_name":"Punjabi & Chinese","cat_id":"2"},{"scat_id":"5","scat_name":"Specials","cat_id":"3"},{"scat_id":"6","scat_name":"Punjabi & Chinese","cat_id":"3"},{"scat_id":"7","scat_name":"Specials","cat_id":"4"},{"scat_id":"8","scat_name":"Punjabi & Chinese","cat_id":"4"},{"scat_id":"9","scat_name":"Specials","cat_id":"11"},{"scat_id":"10","scat_name":"Punjabi & Chinese","cat_id":"11"}]}]';

  var data;
  data =  json.decode(dataSource4);

  print('.................data ' + data[0]['name'].toString());

  InMemoryCache().set(AppKeys.DATA_STORE, data);
  InMemoryCache().set(AppKeys.DATA_MENU, data[1]);
  InMemoryCache().set(AppKeys.DATA_SUBMENU, data[2]);
  InMemoryCache().set(AppKeys.DATA_DISHES, data[0]);

  return data;
}