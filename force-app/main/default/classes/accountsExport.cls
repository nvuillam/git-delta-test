Public Class accountsExport {
	Public Class AccountWrapper {
		Public String tessiAccountId {get; set;}
		Public String siret {get; set;}
		Public String siren {get; set;}
		Public String accountName {get; set;}
		Public String shippingAddress {get; set;}
	}
		
    @future(callout=true)
	public static void send(){
        List<Opportunity> opportunities = [SELECT AccountId FROM Opportunity WHERE Date_StageName_Signee__c = YESTERDAY];
        List<Id> opportunitiesAccounts = new List<Id>();
        for(Opportunity opp : opportunities) {
            opportunitiesAccounts.add(opp.AccountId);
        }
                
		List<Account> accounts = [
			SELECT 
				TESSI_ID__c,
				Siret__c,
				Siren__c,
				Name,
				ShippingAddress
			FROM Account
            WHERE Id IN :opportunitiesAccounts
		];

		List<AccountWrapper> accountsWrapper = new List<AccountWrapper>();
		
		for(Account account : accounts) {
			accountsExport.AccountWrapper accountWrapper = new accountsExport.AccountWrapper();
			accountWrapper.tessiAccountId = ''+account.TESSI_ID__c;
			accountWrapper.siret = ''+account.Siret__c;
			accountWrapper.siren = ''+account.Siren__c;
			accountWrapper.accountName = ''+account.Name;
			accountWrapper.shippingAddress = account.ShippingAddress.getStreet() + ' ' + account.ShippingAddress.getPostalCode() + ' ' + account.ShippingAddress.getCity() + ' ' + account.ShippingAddress.getCountry();
			accountsWrapper.add(accountWrapper);
		}
		
		
		
		
        String JSONBody = Json.serialize(accountsWrapper, true);
        system.debug(JSONBody);
		HttpRequest req = new HttpRequest();
		req.setMethod('POST');
		req.setBody(JSONBody);
		req.setHeader('Content-Type', 'application/json');
		req.setEndpoint(Label.AccountsExportEndPoint);
		
		Http http = new Http();
		HTTPResponse res = http.send(req);

		system.debug(res.getBody());
		//system.debug(res.getStatus());
		//system.debug(res.getStatusCode());
	}
}