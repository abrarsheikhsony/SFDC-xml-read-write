/*----------------------------------------------------------------------
Name: 		XMLWrapper.cls
Purpose: 	An XML wrapper class for a sampe XML string/content
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