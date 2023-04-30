import 'package:dio/dio.dart';

import 'http_config.dart';


Future get(url,{Map<String,dynamic>?query}) async{
  try{
    Response response = Response();
    Dio dio = Dio();
    if(token != " "){
      dio.options.headers = {
        "Content-type":"application/json",
        "Authorization":token
      };
    }

    response = await dio.get(url,queryParameters: query);
    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception("后端服务器异常");
    }
  }catch(e){
    return null;
  }
}

Future post(url,{data,Map<String,dynamic>?query}) async{
  try{
    Response response = Response();
    Dio dio = Dio();
    if(token != ""){
      dio.options.headers = {
        "Content-type":"application/json",
        "Authorization":token
      };
    }
    response = await dio.post(url,data: data,queryParameters: query);
    return response;
  }catch(e){
    print(e);
    return null;
  }
}

Future put(url,{data,Map<String,dynamic>?query}) async{
  try{
    Response response = Response();
    Dio dio = Dio();
    if(token != ""){
      dio.options.headers = {
        "Content-type":"application/json",
        "Authorization":token
      };
    }
    response = await dio.put(url,data: data,queryParameters: query);
    return response;
  }catch(e){
    print(e);
    return null;
  }
}
