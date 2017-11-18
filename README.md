# Reading and Writing XML in Apex
A utility class to read and write XML in Apex using <b>XmlStreamWriter</b> and <b>Document</b> Apex classes.

# Usage

#### Deserializes the XML string/content into an Apex object

XMLWrapper xmlWrapper = new XMLWrapper();
XMLUtility.serialize(xmlWrapper);

Returns:

<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope>
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


XMLWrapper xmlWrapper = new XMLWrapper();
XMLUtility.serialize2(xmlWrapper);

Returns:

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


#### Serializes Apex objects into XML string/content

XMLWrapper xmlWrapper = new XMLWrapper();
String xmlString = XMLUtility.serialize2(xmlWrapper);
XMLWrapper xmlWrapper2 = XMLUtility.deserialize(xmlString);

Retunrs:

XMLWrapper:[
	firstName=Marc,
	lastName=Benioff,
	email=marc.benioff.ceo@salesforce.com,
	mobile=1-800-NO-SOFTWARE,
	fax=415-901-7040,
	country=United States, 
	city=San Francisco, 
	postalCode=CA 94105,
	street=The Landmark @ One Market, Suite 300
]

