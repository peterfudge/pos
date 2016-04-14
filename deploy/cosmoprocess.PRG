************************************************************************
*PROCEDURE CosmoProcess
****************************
***  Function: Processes incoming Web Requests for CosmoProcess
***            requests. This function is called from the wwServer 
***            process.
***      Pass: loServer -   wwServer object reference
*************************************************************************
LPARAMETER loServer
LOCAL loProcess
PRIVATE Request, Response, Server, Session, Process
STORE NULL TO Request, Response, Server, Session, Process

#INCLUDE WCONNECT.H

loProcess = CREATEOBJECT("CosmoProcess", loServer)
loProcess.lShowRequestData = loServer.lShowRequestData

IF VARTYPE(loProcess)#"O"
   *** All we can do is return...
   RETURN .F.
ENDIF

*** Call the Process Method that handles the request
loProcess.Process()

*** Explicitly force process class to release
loProcess.Dispose()

RETURN

*************************************************************
DEFINE CLASS CosmoProcess AS WWC_PROCESS
*************************************************************

*** Response class used - override as needed
cResponseClass = [WWC_PAGERESPONSE]

*** Default for how pages are processed for file only scripts
*** 1 - MVC Template (ExpandTemplate()) 
*** 2 - Web Control Framework Pages
*** 3 - MVC Script (ExpandScript())
nPageScriptMode = 1

*********************************************************************
* Function CosmoProcess :: OnProcessInit
************************************
*** If you need to hook up generic functionality that occurs on
*** every hit against this process class , implement this method.
*********************************************************************
FUNCTION OnProcessInit

*!* LOCAL lcScriptName, llForceLogin
	THIS.InitSession("POS",1800,.t.)	
*!*
*!*	lcScriptName = LOWER(JUSTFNAME(Request.GetPhysicalPath()))
*!*	llIgnoreLoginRequest = INLIST(lcScriptName,"default","login","logout")
*!*
*!*	IF !THIS.Authenticate("any","",llIgnoreLoginRequest) 
*!*	   IF !llIgnoreLoginRequest
*!*		  RETURN .F.
*!*	   ENDIF
*!*	ENDIF

*** Explicitly specify that pages should encode to UTF-8 
*** Assume all form and query request data is UTF-8
Response.Encoding = "UTF8"
Request.lUtf8Encoding = .T.


*** Add CORS header to allow x-site access from other domains/mobile devices
*** Uncomment for JSON Services and change * to allowed domain list
*!*  Response.AppendHeader("Access-Control-Allow-Origin","*")

RETURN .T.
ENDFUNC




*********************************************************************
FUNCTION TestPage()
************************

THIS.StandardPage("Hello World from the CosmoProcess process",;
                  "If you got here, everything is working fine.<p>" + ;
                  "Server Time: <b>" + TIME()+ "</b>")
                  
ENDFUNC
* EOF TestPage


*************************************************************
*** PUT YOUR OWN CUSTOM METHODS HERE                      
*** 
*** Any method added to this class becomes accessible
*** as an HTTP endpoint with MethodName.Extension where
*** .Extension is your scriptmap. If your scriptmap is .rs
*** and you have a function called Helloworld your
*** endpoint handler becomes HelloWorld.rs
*************************************************************


*********************************************************************
FUNCTION CustomerList()
************************

LOCAL lcFilter

lcPhone = Request.Form("Phone")
lcCustno = Request.Form("Custno")
lcName = Request.Form("Name")

IF !EMPTY(lcCustno)
	lcCondition = 'custno=UPPER(lcCustno)' 
ELSE 
	IF !EMPTY(lcName)
		lcCondition = 'upper(lcName)$UPPER(ALLTRIM(company))'
	ELSE &&phone
		lcCondition = 'phone=lcPhone'
	ENDIF 
ENDIF 


SELECT href("customer.cosmo?custno=" + custno,custno) as SBT_Code,company as Name,address1 as Address,city as City, zip as Postal_Code,phone as Phone FROM y:\pro32\ardata\arcust01 INTO CURSOR xcust ;
		WHERE &lcCondition AND custstat = 'A' AND !EMPTY(company) ORDER BY company,city

		
*SELECT href("customer.cosmo?custno=" + custno,custno) as SBT_Code,company as Name,address1 as Address,city as City, zip as Postal_Code,phone as Phone ;
	FROM y:\pro32\ardata\arcust01 INTO CURSOR xcust WHERE (custno = ?lcFilter OR company = ?lcFilter OR city = ?lcFilter OR custno = ?lcFilter) AND custstat = 'A' ;
	AND !EMPTY(company) ORDER BY company,city


lnCount = _Tally
IF lnCount < 1
	this.ErrorMsg("No matching customers found.",;
                     "Please try entering a different or less stringent filter for your albums selection, or "+ ;
                     "leave the filter blank to see all customers.")
	RETURN                        
ENDIF  

Response.WriteLn( THIS.PageHeaderTemplate("Customer List"))

Response.WriteLn([<div class="page-header-text"><i class="fa fa-list"></i> Customer List <span class="badge">] + TRANSFORM(lnCount) + [</span></div>])

loConfig = CREATEOBJECT("HtmlDataGridConfig")
*loConfig.Width = "800px"
*loConfig.DataKeyField = "custno"
loConfig.PageSize = 10

lcHtmlGrid = HtmlDataGrid("xcust",loConfig)
response.write ( lcHtmlGrid )

response.write( this.pagefootertemplate())
                  
ENDFUNC
* EOF TestPage

*********************************************************************

FUNCTION CustomerLookup()
************************

lcLoggedIn = Session.GetSessionVar("loggedin")
*WAIT WINDOW lcLoggedin
IF lcLoggedin <> 'true'
	Response.Redirect("signin.cosmo")		
ENDIF 


lcUserName = ALLTRIM(Session.GetSessionVar("username"))
lcUserDisplay = "Logged in as: "+lcUserName


Response.WriteLn( THIS.PageHeaderTemplate("Customer Lookup"))

Response.WriteLn([<div class="page-header-text"><i class="fa fa-search"></i> Customer Lookup</div>])

TEXT TO lcHtml NOSHOW 
            <form id="CustomerListForm" action="CustomerList.cosmo" method="POST">
                <p>
                    <label></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-search"></i></span>
                        <input name="Phone" id="CustomerFilter" class="form-control"
                               placeholder="Enter a phone number    -must be in format: 111/222-3333">
                    </div>
                    
                </p>
            
            
                <p>
                    <label></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-search"></i></span>
                        <input name="Custno" id="CustomerFilter" class="form-control"
                               placeholder="Enter an SBT Customer Code">
                    </div>
                    
                </p>
            
                <p>
                    <label></label>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-search"></i></span>
                        <input name="Name" id="CustomerFilter" class="form-control"
                               placeholder="Enter all or part of the Customer's Name">
                    </div>
                    
                </p><br>
                <div>
                <button class="btn btn-success" type="submit">Submit</button>	
                </div>
            </form>
ENDTEXT 

Response.WriteLn(lcHtml)

response.write( this.pagefootertemplate())
                  
ENDFUNC
* EOF TestPage

FUNCTION Customer()
************************

lcCustno = Request.Params("custno")

SELECT custno,company as Name,address1 as Address,city as City,zip as Postal,phone as Phone,ALLTRIM(email) as email,contact ;
	FROM y:\pro32\ardata\arcust01 INTO CURSOR xcustomer ;
	WHERE custno = ?lcCustno


Response.WriteLn( THIS.PageHeaderTemplate("Customer Details"))


Response.WriteLn([<div class="page-header-text"><i class="fa fa-user"></i> ]+xcustomer.Name+[</div>])

SELECT xcustomer
lcHtml = HtmlRecord("xcustomer")
Response.WriteLn(lcHtml)


*gstring = ALLTRIM(xcustomer.name)+','+ALLTRIM(xcustomer.address)+','+ALLTRIM(xcustomer.city)+','+ALLTRIM(xcustomer.postal)
*googlestring = STRTRAN(gstring,' ','%20')

*Response.WriteLn([<iframe width="600" height="400" src="https://www.google.com/maps/embed/v1/place?q=]+googlestring+[&zoom=15 &attribution_source=Google+Maps+Embed+API&attribution_web_url=https://developers.google.com/maps/documentation/embed/&key=AIzaSyAnRFzUpSjn_GT6bYM3eTb-JYTrwva1TB4">  </iframe>])


Response.WriteLn( [<br><br><a href="newticket.cosmo" type="submit" name="btnSubmit" class="btn btn-success"><i class="fa fa-lg fa-shopping-cart"></i>    Start New Ticket</a>] )

* google maps api key
* AIzaSyAnRFzUpSjn_GT6bYM3eTb-JYTrwva1TB4



response.write( this.pagefootertemplate())
                  
ENDFUNC
* EOF TestPage


FUNCTION NewTicket()
************************

Response.WriteLn( THIS.PageHeaderTemplate("New Ticket"))


Response.WriteLn([<div class="page-header-text"><i class="fa fa-user"></i>Create New POS Ticket</div>])


response.write( this.pagefootertemplate())
                  
ENDFUNC
* EOF TestPage


*******************************
FUNCTION signin()

lcUserDisplay = ""

Response.WriteLn( THIS.PageHeaderTemplate("Login"))

Response.ExpandTemplate()

Response.Write( this.pagefootertemplate())


ENDFUNC

*******************************
FUNCTION logincheck()

Session.SetSessionVar("loggedin","")
Session.SetSessionVar("user","")
Session.SetSessionVar("username","")
	IF USED('xtest')
		USE IN xtest
	ENDIF 

lcUser = Request.Form("user")
lcPass = UPPER(Request.Form("pwd"))

SELECT userid,name,passwd FROM e:\pro32\syuuser INTO CURSOR xtest WHERE ALLTRIM(userid) == alltrim(lcuser) AND ALLTRIM(passwd) == ALLTRIM(lcPass)

SELECT xtest

IF RECCOUNT() > 0
	*WAIT WINDOW "yeah baby"
	Session.SetSessionVar("loggedin","true")
	Session.SetSessionVar("user",xtest.userid)
	Session.SetSessionVar("username",xtest.name)
	lcuser = ''
	lcpass = ''
	Response.Redirect("customerlookup.cosmo")
ELSE 
	Response.Redirect("signin.cosmo")
ENDIF 







ENDFUNC



ENDDEFINE
