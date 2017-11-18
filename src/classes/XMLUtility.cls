/*----------------------------------------------------------------------
Name: 		XMLUtility.cls
Purpose: 	An XML utility for:
(1) Deserializes the XML string/content into an Apex object.
(2) Serializes Apex objects into XML string/content.
------------------------------History----------------------------------
Version 	Author 		Date 					Detail Description 
-------		-------		-------------- 			------------------
1.0 		Abrar 		18-November-2017		Initial Development	
----------------------------------------------------------------------*/
public with sharing class XMLUtility{

    /*----------------------------------------------------------------------
    Purpose:    Deserializes the XML string/content into an Apex object
    Parameters: 
    Returns:    
    ------------------------------History----------------------------------
    Version 	Author 		Date 				Detail Description 
    -------		------- 	-------------- 		------------------
    1.0     	Abrar 		18-November-2017 	Initial Development
    ----------------------------------------------------------------------*/
    public static XMLWrapper deserialize(String xmlString){
    	XMLWrapper xmlWrapper = new XMLWrapper();
        Dom.Document domDocument = new Dom.Document();

        domDocument.load( xmlString );
        Dom.XMLNode envelopeNodeElement = domDocument.getRootElement();//soapenv:Envelope

        for(Dom.XMLNode bodyNodeElement : envelopeNodeElement.getChildElements()) {//soapenv:Envelope
            for(Dom.XMLNode requestChildElement : bodyNodeElement.getChildElements()){//soapenv:Body
	            for(Dom.XMLNode requestNodeChildElement : requestChildElement.getChildElements()){//info:Request
	            	if(requestNodeChildElement.getName() == 'Customer'){//info:Customer
						xmlWrapper.firstName = requestNodeChildElement.getChildElement('FirstName',requestNodeChildElement.getNamespace()).getText();
						xmlWrapper.lastName = requestNodeChildElement.getChildElement('LastName',requestNodeChildElement.getNamespace()).getText();
						xmlWrapper.email = requestNodeChildElement.getChildElement('Email',requestNodeChildElement.getNamespace()).getText();
						xmlWrapper.mobile = requestNodeChildElement.getChildElement('Mobile',requestNodeChildElement.getNamespace()).getText();
						xmlWrapper.fax = requestNodeChildElement.getChildElement('Fax',requestNodeChildElement.getNamespace()).getText();
	            	}
	            	else if(requestNodeChildElement.getName() == 'Address'){//info:Address
						xmlWrapper.country = requestNodeChildElement.getChildElement('Country',requestNodeChildElement.getNamespace()).getText();
						xmlWrapper.city = requestNodeChildElement.getChildElement('City',requestNodeChildElement.getNamespace()).getText();
						xmlWrapper.postalCode = requestNodeChildElement.getChildElement('PostalCode',requestNodeChildElement.getNamespace()).getText();
						xmlWrapper.street = requestNodeChildElement.getChildElement('Street',requestNodeChildElement.getNamespace()).getText();
	            	}
	            }
            }
        }

		System.Debug('XML Wrapper: '+ xmlWrapper);
    	return xmlWrapper;
    }

    /*----------------------------------------------------------------------
    Purpose:    Serializes Apex objects into XML string/content
    Parameters: 
    Returns:    
    ------------------------------History----------------------------------
    Version 	Author 		Date 				Detail Description 
    -------		------- 	-------------- 		------------------
    1.0     	Abrar 		18-November-2017 	Initial Development
    ----------------------------------------------------------------------*/
    public static String serialize(XMLWrapper xmlWrapper){
		//String startXML = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:info="https://xml2apex.herokuapp.com">';
        //String endXML = '</soapenv:Envelope>';
        String prefix = 'info';
		String namespaceUri = 'xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:info="https://xml2apex.herokuapp.com"';

        XmlStreamWriter w = new XmlStreamWriter();
        w.writeStartDocument('UTF-8', '1.0');
            w.writeStartElement('soapenv', 'Envelope', namespaceUri);
	            w.writeStartElement('soapenv', 'Body', namespaceUri);

		            w.writeStartElement(prefix, 'Request', '');
			            w.writeStartElement(prefix, 'Customer', '');
				            w.writeStartElement(prefix, 'FirstName', '');
				            	w.writeCharacters( xmlWrapper.firstName );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'LastName', '');
				            	w.writeCharacters( xmlWrapper.lastName );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'Email', '');
				            	w.writeCharacters( xmlWrapper.email );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'Mobile', '');
				            	w.writeCharacters( xmlWrapper.mobile );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'Fax', '');
				            	w.writeCharacters( xmlWrapper.fax );
							w.writeEndElement();
			            w.writeEndElement();
			            w.writeStartElement(prefix, 'Address', '');
				            w.writeStartElement(prefix, 'Country', '');
				            	w.writeCharacters( xmlWrapper.country );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'City', '');
					            	w.writeCharacters( xmlWrapper.city );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'PostalCode', '');
				            	w.writeCharacters( xmlWrapper.postalCode );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'Street', '');
				            	w.writeCharacters( xmlWrapper.street );
							w.writeEndElement();
			            w.writeEndElement();
		            w.writeEndElement();

	            w.writeEndElement();	            
            w.writeEndElement();
        w.writeEndDocument();

        String xmlOutput = w.getXmlString();
        w.close();

		System.Debug('XML String: '+ xmlOutput);
        //return startXML + xmlOutput + endXML;
        return xmlOutput;
    }

    /*----------------------------------------------------------------------
    Purpose:    Serializes Apex objects into XML string/content
    Parameters: 
    Returns:    
    ------------------------------History----------------------------------
    Version 	Author 		Date 				Detail Description 
    -------		------- 	-------------- 		------------------
    1.0     	Abrar 		18-November-2017 	Initial Development
    ----------------------------------------------------------------------*/
    public static String serialize2(XMLWrapper xmlWrapper){
		String startXML = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:info="https://xml2apex.herokuapp.com">';
        String endXML = '</soapenv:Envelope>';
        String prefix = 'info';
		String namespaceUri = 'xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:info="https://xml2apex.herokuapp.com"';

        XmlStreamWriter w = new XmlStreamWriter();
        //w.writeStartDocument('UTF-8', '1.0');
            //w.writeStartElement('soapenv', 'Envelope', namespaceUri);
	            w.writeStartElement('soapenv', 'Body', namespaceUri);

		            w.writeStartElement(prefix, 'Request', '');
			            w.writeStartElement(prefix, 'Customer', '');
				            w.writeStartElement(prefix, 'FirstName', '');
				            	w.writeCharacters( xmlWrapper.firstName );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'LastName', '');
				            	w.writeCharacters( xmlWrapper.lastName );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'Email', '');
				            	w.writeCharacters( xmlWrapper.email );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'Mobile', '');
				            	w.writeCharacters( xmlWrapper.mobile );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'Fax', '');
				            	w.writeCharacters( xmlWrapper.fax );
							w.writeEndElement();
			            w.writeEndElement();
			            w.writeStartElement(prefix, 'Address', '');
				            w.writeStartElement(prefix, 'Country', '');
				            	w.writeCharacters( xmlWrapper.country );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'City', '');
					            	w.writeCharacters( xmlWrapper.city );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'PostalCode', '');
				            	w.writeCharacters( xmlWrapper.postalCode );
							w.writeEndElement();
				            w.writeStartElement(prefix, 'Street', '');
				            	w.writeCharacters( xmlWrapper.street );
							w.writeEndElement();
			            w.writeEndElement();
		            w.writeEndElement();

	            w.writeEndElement();	            
            //w.writeEndElement();
        //w.writeEndDocument();

        String xmlOutput = w.getXmlString();
        w.close();

		System.Debug('XML String: '+ startXML + xmlOutput + endXML);
        return startXML + xmlOutput + endXML;
        //return xmlOutput;
    }

}