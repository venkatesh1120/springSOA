public class CallOutTestCTRL {
    public string responseText{get;set;}
    public CallOutTestCTRL(){
        String endPoint = 'https://postman-echo.com/get?foo1=bar1&foo2=bar2';
        Http http = new Http();
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        httpReq.SetMethod('GET');
        httpReq.setEndpoint(endPoint);
        try{
            httpRes = http.send(httpReq);
        }
        catch(System.Exception e){
            System.debug('Exception found in class  method  ' + e.getMessage());
            System.debug('Exception found in class  method  ' + e.getLineNumber());
        }
        system.debug('response'+httpRes);
        system.debug('response body'+httpRes.getBody());
        responseText =httpRes.getBody();
    }
}