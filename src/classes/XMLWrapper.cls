/*----------------------------------------------------------------------
Name: 		XMLWrapper.cls
Purpose: 	An XML wrapper class for a sampe XML string/content
------------------------------------------------------------------------
<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:info="https://xml2apex.herokuapp.com">
   <soapenv:Body>
     <info:Request>
        <info:Customer>
           <info:FirstName>Marc</info:FirstName>
           <info:LastName>Benioff</info:LastName>
           <info:Email>marc.benioff.ceo@salesforce.com</info:Email>
           <info:Mobile>1-800-NO-SOFTWARE</info:Mobile>
           <info:Fax>415-901-7040</info:Fax>
        </info:Customer>
        <info:Address>
           <info:Country>United States</info:Country>
           <info:City>San Francisco</info:City>
           <info:PostalCode>CA 94105</info:PostalCode>
           <info:Street>The Landmark @ One Market, Suite 300</info:Street>
        </info:Address>
     </info:Request>
   </soapenv:Body>
</soapenv:Envelope>
------------------------------History----------------------------------
Version 	Author 		Date 					Detail Description 
-------		-------		-------------- 			------------------
1.0 		Abrar 		18-November-2017		Initial Development	
----------------------------------------------------------------------*/
public with sharing class XMLWrapper{

	public String firstName;
	public String lastName;
	public String email;
	public String mobile;
	public String fax;
	public String country;
	public String city;
	public String postalCode;
	public String street;

	public XMLWrapper(){
		// Set default values
		firstName = 'Marc';
		lastName = 'Benioff';
		email = 'marc.benioff.ceo@salesforce.com';
		mobile = '1-800-NO-SOFTWARE';
		fax = '415-901-7040';
		country = 'United States';
		city = 'San Francisco';
		postalCode = 'CA 94105';
		street = 'The Landmark @ One Market, Suite 300';
	}

}