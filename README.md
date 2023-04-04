Demo repo to reproduce https://github.com/scolladon/sfdx-git-delta/issues/548

Clone the repo, pull master, integration and init-ci branches, then run the following commands

```shell
echo y | sfdx plugins:install sfdx-git-delta@latest-rc
echo y | sfdx plugins:install sfdx-hardis
echo y | sfdx plugins:install sfdx-essentials

git checkout init-ci
sfdx hardis:work:save
# Select "Yes, my commit is ready"
# Wait...
# Look at the added commit: manifest/package.xml contains .eslintrc file
# If you look in the logs you'll see the tmp output folder for sfdx-git-delta
# If you open it, you'll see a package.xml with .eslintrc file too
```

Full logs:

```shell
$ sfdx hardis:work:save
[sfdx-hardis][command] sfdx force:org:display --json
[sfdx-hardis] You are already connected as cloudity@federaly.fr on org https://federaly12.my.salesforce.com
[sfdx-hardis] If this is NOT the org you want to play with, hit CTRL+C, then input sfdx hardis:org:select
[sfdx-hardis][command] git ls-remote --get-url
[sfdx-hardis] Selected target branch is integration
[sfdx-hardis] This script will prepare the merge request from your local branch init-ci to remote integration
[sfdx-hardis][command] git status --porcelain -b -u --null
? 🦙  Is your commit ready ? Yes, my commit is ready !
[sfdx-hardis][command] git log --pretty=format:òòòòòò %H ò %aI ò %s ò %D ò %b ò %aN ò %aE òò integration..init-ci
[sfdx-hardis][command] git merge-base integration init-ci
[sfdx-hardis] Calculating package.xml diff from [integration] to [init-ci - README]
[sfdx-hardis][command] git rev-parse --show-toplevel
✔ [sfdx-hardis][command] sfdx sgd:source:delta --from 59a9d219d7f0b9a89f75bcadb8ea6ca078d6e106 --to 51800a3ff84d52568bb43740c1fa4b39aba65c3d --output C:\Users\NVUILL~1\AppData\Local\Temp\sfdx-hardis-aujq6o --json
[sfdx-hardis] {
  "status": 0,
  "result": null
}

[sfdx-hardis] destructiveChanges.xml diff to be merged within manifest\destructiveChanges.xml:
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
    <version>57.0</version>
</Package>
[sfdx-hardis][command] sfdx essentials:packagexml:append --packagexmls manifest\destructiveChanges.xml,C:\Users\NVUILL~1\AppData\Local\Temp\sfdx-hardis-aujq6o\destructiveChanges\destructiveChanges.xml --outputfile manifest\destructiveChanges.xml
[sfdx-hardis][command] git status --porcelain -b -u --null
[sfdx-hardis] package.xml diff to be merged within manifest\package.xml:
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
    <types>
        <members>accountsExport</members>
        <members>accountsExportCalloutMockTest</members>
        <name>ApexClass</name>
    </types>
    <types>
        <members>.eslintrc</members>
        <members>CommunityFooter</members>
        <members>CommunityHome</members>
        <members>CommunityHomeApp</members>
        <members>test</members>
        <name>AuraDefinitionBundle</name>
    </types>
    <types>
        <members>.eslintrc</members>
        <name>LightningComponentBundle</name>
    </types>
    <types>
        <members>Account</members>
        <members>Case</members>
        <members>Contact</members>
        <members>Offre__c</members>
        <members>Opportunity</members>
        <members>OpportunityTeamMember</members>
        <members>Prestation__c</members>
        <members>User</members>
        <name>Workflow</name>
    </types>
    <types>
        <members>Case.High_1_day_of_investigation_left_before_Escalation</members>
        <members>Case.High_15_min_of_investigation_left_before_Escalation</members>
        <members>Case.Medium_1_day_of_investigation_left_before_Escalation</members>
        <members>Case.Meidum_1_hour_of_investigation_left_before_Escalation</members>
        <members>Case.Send_an_email_case_closed</members>
        <members>Case.Send_an_email_when_a_case_is_open</members>
        <members>Opportunity.Alert_email_opportunity_team</members>
        <members>Opportunity.Alert_Email_Opportunity_Team_100</members>
        <members>Opportunity.Email_when_stage_reach_100_for_TDS_Profile</members>
        <members>Opportunity.test_opportunity_100</members>
        <members>OpportunityTeamMember.EA_Assignation_consultant_avant_vente</members>
        <members>OpportunityTeamMember.EA_Information_owner_Assignation_consultant_avant_vente</members>
        <members>Prestation__c.Tessi_Sign_Prestation</members>
        <name>WorkflowAlert</name>
    </types>
    <types>
        <members>Account.check</members>
        <members>Account.Check_box_inactif_account</members>
        <members>Account.Check_inactif_account</members>
        <members>Account.GDPR_check</members>
        <members>Account.Update_Owner</members>
        <members>Account.When_offer_create_tag_field_in_account</members>
        <members>Case.CaseUpdateTier1ToTier2</members>
        <members>Contact.Update_owner</members>
        <members>Opportunity.Account_GDPR</members>
        <members>Opportunity.Close_date</members>
        <members>Opportunity.DateSignature</members>
        <members>Opportunity.field_account_incatif</members>
        <members>Opportunity.inactif_account</members>
        <members>Opportunity.need_for_presale_date_checked</members>
        <members>Opportunity.Pooulate_Amount</members>
        <members>Prestation__c.Delivery_Cost_Date_in_Opp</members>
        <members>User.Update_ID</members>
        <name>WorkflowFieldUpdate</name>
    </types>
    <types>
        <members>Account.Flague account</members>
        <members>Account.Last activity account</members>
        <members>Account.Update_owner_compte</members>
        <members>Account.WF_Account_Old_Client</members>
        <members>Case.AutoEmailToContactCaseClosed</members>
        <members>Case.AutoEmailToContactCaseNew</members>
        <members>Contact.Update_owner_contact</members>
        <members>Offre__c.When offer create tag field in account</members>
        <members>Opportunity.Alert - Email Opportunity Team 100</members>
        <members>Opportunity.Alert email Opportunity team</members>
        <members>Opportunity.Alerte Closed won</members>
        <members>Opportunity.Close date update</members>
        <members>Opportunity.Date de signature</members>
        <members>Opportunity.need for presale date checked</members>
        <members>Opportunity.populate_Amount</members>
        <members>Prestation__c.Chiffrage de prestation</members>
        <members>Prestation__c.Link Prestation Date in Opportunity</members>
        <members>Prestation__c.TessiSign_prestation_created</members>
        <members>User.WF_Id_EXT</members>
        <name>WorkflowRule</name>
    </types>
    <version>57.0</version>
</Package>
[sfdx-hardis][command] sfdx essentials:packagexml:append --packagexmls manifest\package.xml,C:\Users\NVUILL~1\AppData\Local\Temp\sfdx-hardis-aujq6o\package\package.xml --outputfile manifest\package.xml
[sfdx-hardis][command] sfdx essentials:packagexml:remove --packagexml manifest\package.xml --removepackagexml manifest\destructiveChanges.xml 
--outputfile manifest\package.xml
[sfdx-hardis][command] git status --porcelain -b -u --null
[sfdx-hardis][command] git status --porcelain -b -u --null
[sfdx-hardis] Committing files in local git branch init-ci...
[command] git -c core.abbrev=40 commit -m [sfdx-hardis] Update package content
[init-ci b95ba32af0f37f05a47ff1fee033fae078eed14c] [sfdx-hardis] Update package content
 2 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 manifest/destructiveChanges.xml

[sfdx-hardis][command] git status --porcelain -b -u --null
[sfdx-hardis][
  "README.md"
]
[sfdx-hardis] Cleaning sfdx project from obsolete references...
[sfdx-hardis] Apply cleaning of references to destructivechanges (References to destructiveChanges.xml items)...
[sfdx-hardis][command] sfdx essentials:metadata:filter-xml-content -c C:\Users\NVUILL~1\AppData\Local\Temp\sfdx-hardis-xn1mss\clean_destructivechanges.json --inputfolder ./force-app/main/default --outputfolder ./force-app/main/default --noinsight
[sfdx-hardis] Cleaning package.xml files...
[sfdx-hardis] Removing obsolete files...
[sfdx-hardis] Cleaning complete
[sfdx-hardis] Cleaning sfdx project using patterns and xpaths defined in cleanXmlPatterns...
[sfdx-hardis] Clean XML elements matching patterns
[sfdx-hardis] Using configuration from property cleanXmlPatterns in .sfdx-hardis.yml config file...
[sfdx-hardis] Updated 0 XML files
[sfdx-hardis][command] git status --porcelain -b -u --null
[sfdx-hardis] {
  "not_added": [],
  "conflicted": [],
  "created": [],
  "deleted": [],
  "modified": [
    "README.md"
  ],
  "renamed": [],
  "files": [
    {
      "path": "README.md",
      "index": " ",
      "working_dir": "M"
    }
  ],
  "staged": [],
  "ahead": 1,
  "behind": 0,
  "current": "init-ci",
  "tracking": "origin/init-ci",
  "detached": false
}
[sfdx-hardis] Updated config file D:\git\tmp\git-delta-test\config\.sfdx-hardis.yml with values: 
{
  "deploymentPlan": {
    "packages": []
  }
}
[sfdx-hardis][command] git status --porcelain -b -u --null
[command] git -c core.abbrev=40 commit -m [sfdx-hardis] Update deployment plan
[init-ci 33a11d89fd36688be1245cc883129f57677d0792] [sfdx-hardis] Update deployment plan
 1 file changed, 2 insertions(+)

? 🦙  Do you want to push your commit(s) on git server ? (git push in remote git branch init-ci) ☓ No
[sfdx-hardis] If your work is completed, you can create a merge request:
[sfdx-hardis] - click on the link in the upper text, below To create a merge request for init-ci, visit
[sfdx-hardis] - or manually create the merge request on repository UI: https://github.com/nvuillam/git-delta-test.git

[sfdx-hardis] When your Merge Request will have been merged:
  - DO NOT REUSE THE SAME BRANCH
  - Use New task menu (sfdx hardis:work:new), even if you work in the same sandbox or scratch org :)
[sfdx-hardis] hardis:work:save execution time 0:01:52.899
```
