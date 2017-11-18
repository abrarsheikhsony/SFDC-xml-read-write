# Reading and Writing XML in Apex
A utility class to read and write XML in Apex using <a href="https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_xml_XmlStream_writer.htm" target="_blank" alt="XmlStreamWriter">XmlStreamWriter</a> and <a href="https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_xml_dom_document.htm" target="_blank" alt="Document">Document</a> Apex classes.

#### Serializes Apex objects into XML string/content

(1) To serialize the Apex object, call the XMLUtility.serialize(XMLWrapper xmlWrapper) method by passing XMLWrapper object.

```
XMLWrapper xmlWrapper = new XMLWrapper();
XMLUtility.serialize(xmlWrapper);
```

Returns:

```
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
```

(2) To serialize the Apex object, call the XMLUtility.serialize2(XMLWrapper xmlWrapper) method by passing XMLWrapper object.

```
XMLWrapper xmlWrapper = new XMLWrapper();
XMLUtility.serialize2(xmlWrapper);
```

Returns:

```
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
```

#### Deserializes the XML string/content into an Apex object

(1) To deserialize the XML string, call the XMLUtility.deserialize(String xmlString) method by passing XML string.

```
XMLWrapper xmlWrapper = new XMLWrapper();
String xmlString = XMLUtility.serialize2(xmlWrapper);
XMLWrapper xmlWrapper2 = XMLUtility.deserialize(xmlString);
```

Retunrs:

```
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
```

<b>Note:</b>
In the XML tag "<soapenv:Envelope>", if it will not have any namespace "info" bound to element prefix soapenv then you will get an exception says:

"System.XmlException: Failed to parse XML due to: could not determine namespace bound to element prefix soapenv (position: START_DOCUMENT seen <?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope>... @1:56)"

For example:
This will work
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:info="https://xml2apex.herokuapp.com">

This will NOT = <soapenv:Envelope>
